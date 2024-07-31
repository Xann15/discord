<?php

use Dotenv\Dotenv;

// Menyertakan autoload Composer
require_once __DIR__ . '/../vendor/autoload.php';

// Memuat file .env dari direktori root
$dotenv = Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

// Konfigurasi tambahan (jika diperlukan) dapat ditambahkan di sini

function data($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

define("BASEURL", "http://192.168.1.80:8080/discord");
