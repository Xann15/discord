<?php
require '../../init.php';


$userId = $_POST['userId'];

// // Perbarui status online
// $db->query("UPDATE users SET last_activity = NOW() WHERE user_id = $userId");


// Waktu toleransi dalam detik (misalnya 10 detik)
$tolerance = 2;

// Perbarui status online untuk user yang mengirim request
$queryUpdate = "UPDATE users SET last_activity = NOW(), status = 'online' WHERE user_id = $userId";
if (!$db->query($queryUpdate)) {
    echo 'Update failed: ' . $db->error;
    exit;
}

// Periksa dan perbarui status offline untuk semua user yang telah melebihi batas waktu toleransi
$queryOffline = "UPDATE users SET status = 'offline' WHERE last_activity < NOW() - INTERVAL $tolerance SECOND AND status = 'online'";
if (!$db->query($queryOffline)) {
    echo 'Offline update failed: ' . $db->error;
    exit;
}

echo 'Status updated and offline checked successfully';

$db->close();
