<?php
<?php
session_start();
$db = @mysqli_connect('localhost:3306','root','','travel');

if (!$db) {
    die("Database connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: booking.html');
    exit;
}

$ffirst = trim($_POST['ffirst'] ?? '');
$flast = trim($_POST['flast'] ?? '');
$femail = trim($_POST['femail'] ?? '');
$city = trim($_POST['city'] ?? '');
$fphone = trim($_POST['fphone'] ?? '');
$fdesti = trim($_POST['fdesti'] ?? '');

if (!$ffirst || !$flast || !$femail || !$city || !$fphone || !$fdesti) {
    echo "<script>alert('Please fill all fields'); window.location='booking.html';</script>";
    exit;
}

$stmt = $db->prepare("INSERT INTO booking (ffirst, flast, femail, city, fphone, fdesti) VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssss", $ffirst, $flast, $femail, $city, $fphone, $fdesti);

if ($stmt->execute()) {
    echo "<script>alert('Booking confirmed! We will contact you soon.'); window.location='mainPage.html';</script>";
} else {
    echo "Booking error: " . $db->error;
}
$stmt->close();
?>