import os
import json
import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import NearestNeighbors
import joblib
from scipy.sparse import hstack

os.makedirs("models", exist_ok=True)

csv_path = os.path.join("dataset", "uttarakhand_tourism_dataset.csv")
df = pd.read_csv(csv_path)

def parse_list(val):
    if pd.isna(val): return []
    if isinstance(val, list): return val
    s = str(val).strip()
    s = s.strip("[]()")
    s = s.replace(";", ",")
    parts = [p.strip().strip("'\"") for p in s.split(",") if p.strip()]
    return parts

# Adjust these column names if your CSV uses different names
df['activities_list'] = df.get('activities', '').apply(parse_list)
df['best_months_list'] = df.get('best_months', '').apply(parse_list).apply(lambda lst: [int(x) for x in lst if str(x).isdigit()])

df['text'] = df.get('name', '').fillna('') + ' ' + df.get('category', '').fillna('') + ' ' + df.get('city', '').fillna('') + ' ' + df['activities_list'].apply(lambda a: " ".join(a))

vectorizer = TfidfVectorizer(max_features=2000, ngram_range=(1,2))
X_text = vectorizer.fit_transform(df['text'].values)

num_cols = []
for key in ('rating','avg_cost','user_score'):
    if key in df.columns:
        num_cols.append(key)

if num_cols:
    X_num = df[num_cols].fillna(0).astype(float).values
    scaler = StandardScaler()
    X_num_scaled = scaler.fit_transform(X_num)
else:
    # create dummy scaler with 0-shape to keep API simpler
    X_num_scaled = np.zeros((len(df), 0))
    scaler = StandardScaler()
    # fit scaler on an array with zero columns is not possible; mark with attribute
    scaler.mean_ = np.array([])
    scaler.scale_ = np.array([])

X = hstack([X_text, X_num_scaled]) if X_num_scaled.size else X_text

nn = NearestNeighbors(n_neighbors=min(50, X.shape[0]), metric='cosine', algorithm='brute')
nn.fit(X)

joblib.dump(vectorizer, os.path.join("models", "vectorizer.joblib"))
joblib.dump(scaler, os.path.join("models", "scaler.joblib"))
joblib.dump(nn, os.path.join("models", "nn.joblib"))

items = []
for i, row in df.iterrows():
    items.append({
        "idx": int(i),
        "id": int(row.get('id', i)) if not pd.isna(row.get('id', i)) else int(i),
        "name": str(row.get('name','')),
        "category": str(row.get('category','')),
        "city": str(row.get('city','')),
        "activities": row.get('activities_list', []),
        "rating": float(row.get('rating', 0) or 0),
        "avg_cost": float(row.get('avg_cost', 0) or 0),
        "best_months": row.get('best_months_list', []),
        "user_score": float(row.get('user_score', 0) or 0)
    })

with open("models/items.json", "w", encoding="utf-8") as f:
    json.dump(items, f, ensure_ascii=False, indent=2)

print("Training complete. Models saved to ./models (vectorizer, scaler, nn) and items.json")