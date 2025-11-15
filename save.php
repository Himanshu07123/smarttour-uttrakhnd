<?php
<?php
$db = @mysqli_connect('localhost:3306','root','','travel');
if (!$db) {
    die("Database connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: signup.php');
    exit;
}

$fname = trim($_POST['fname'] ?? '');
$password = $_POST['password'] ?? '';
$email = trim($_POST['email'] ?? '');
$city = trim($_POST['city'] ?? '');
$phone = trim($_POST['phone'] ?? '');

if (!$fname || !$password || !$email) {
    echo "<script>alert('Please fill required fields'); window.location='signup.php';</script>";
    exit;
}

// check if username exists
$stmt = $db->prepare("SELECT 1 FROM customer WHERE fname = ? LIMIT 1");
$stmt->bind_param("s", $fname);
$stmt->execute();
$stmt->store_result();
if ($stmt->num_rows > 0) {
    $stmt->close();
    echo "<script>alert('Username already taken'); window.location='signup.php';</script>";
    exit;
}
$stmt->close();

// hash password and insert
$hash = password_hash($password, PASSWORD_DEFAULT);
$ins = $db->prepare("INSERT INTO customer (fname, password, email, city, phone) VALUES (?, ?, ?, ?, ?)");
$ins->bind_param("sssss", $fname, $hash, $email, $city, $phone);
if ($ins->execute()) {
    $ins->close();
    echo "<script>alert('Signup successful! Please sign in.'); window.location='index.html';</script>";
    exit;
} else {
    echo "Insert error: " . $db->error;
}
?>
