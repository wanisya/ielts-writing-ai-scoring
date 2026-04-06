<?php
$host = "localhost";
$user = "root";       // sesuaikan jika beda
$pass = "";           // sesuaikan
$db   = "ielts_writing_test";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}
?>
