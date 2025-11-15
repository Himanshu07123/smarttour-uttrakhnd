from flask import Flask, request, jsonify
from flask_cors import CORS
import joblib
import os
import numpy as np
import json
from scipy.sparse import hstack

app = Flask(__name__)
CORS(app)  # allow browser requests from your frontend

models_dir = "models"

# load models; return helpful error if missing
try:
    vectorizer = joblib.load(os.path.join(models_dir, "vectorizer.joblib"))
    scaler = joblib.load(os.path.join(models_dir, "scaler.joblib"))
    nn = joblib.load(os.path.join(models_dir, "nn.joblib"))
    with open(os.path.join(models_dir, "items.json"), "r", encoding="utf-8") as f:
        items = json.load(f)
except Exception as e:
    msg = f"Model load error: {e}. Run train.py to create models in {os.path.abspath(models_dir)}"
    raise RuntimeError(msg)

def build_query_vector(pref):
    parts = []
    if pref.get("activity"):
        parts.append(pref["activity"])
    if pref.get("city"):
        parts.append(pref["city"])
    if pref.get("name"):
        parts.append(pref["name"])
    text = " ".join(parts).strip()
    X_text = vectorizer.transform([text])

    # determine number of numeric features scaler was fit on
    n_num = getattr(scaler, "mean_", np.array([])).shape[0] if hasattr(scaler, "mean_") else 0
    if n_num > 0:
        max_budget = float(pref.get("max_budget", 0) or 0)
        # assume training order was rating, avg_cost, user_score (fallbacks if fewer)
        if n_num == 3:
            num_array = np.array([[0.0, max_budget, 0.0]])
        elif n_num == 2:
            num_array = np.array([[0.0, max_budget]])
        else:
            num_array = np.array([[max_budget]])
        num_scaled = scaler.transform(num_array)
    else:
        num_scaled = np.zeros((1,0))

    q = hstack([X_text, num_scaled])
    return q

@app.route("/recommend", methods=["POST"])
def recommend():
    try:
        data = request.get_json() or {}
        top_k = int(data.get("top_k", 6))

        # apply simple filters first (city / activity / month)
        filtered_indices = list(range(len(items)))
        if data.get("city"):
            filtered_indices = [i for i in filtered_indices if items[i].get('city') and items[i]['city'].lower() == str(data['city']).lower()]
        if data.get("activity"):
            filtered_indices = [i for i in filtered_indices if any(data['activity'].lower() == a.lower() for a in items[i].get('activities', []))]
        if data.get("month"):
            try:
                month = int(data['month'])
                filtered_indices = [i for i in filtered_indices if month in items[i].get('best_months', [])]
            except:
                pass

        if not filtered_indices:
            filtered_indices = list(range(len(items)))

        q = build_query_vector(data)
        # request more neighbors and then filter down to filtered_indices
        neigh = min(50, len(items))
        distances, indices = nn.kneighbors(q, n_neighbors=neigh)
        indices = indices.flatten().tolist()

        results = []
        for idx in indices:
            if idx in filtered_indices:
                results.append(items[idx])
                if len(results) >= top_k:
                    break

        # if still short, append from filtered_indices
        if len(results) < top_k:
            for idx in filtered_indices:
                if items[idx] not in results:
                    results.append(items[idx])
                if len(results) >= top_k:
                    break

        return jsonify({"results": results})
    except Exception as exc:
        return jsonify({"error": str(exc)}), 500

if __name__ == "__main__":
    # bind to localhost:5000; keep debug=False for stability if desired
    app.run(host="127.0.0.1", port=5000, debug=True)