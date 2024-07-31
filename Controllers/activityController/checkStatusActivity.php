<?php
require '../../init.php';
$userId = $_POST['userId'];
// Ambil status terbaru dari pengguna
$queryStatus = "SELECT status FROM users WHERE user_id = $userId";
$result = $db->query($queryStatus);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo $row['status'];
} else {
    echo 'User not found';
}

$db->close();
