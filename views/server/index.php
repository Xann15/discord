<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($title, ENT_QUOTES, 'UTF-8') ?></title>
</head>

<body>
    <h1><?= htmlspecialchars($title, ENT_QUOTES, 'UTF-8') ?></h1>
    <p>Server ID: <?= htmlspecialchars($server_id, ENT_QUOTES, 'UTF-8') ?></p>
    <p>:<?= $_ENV['APP_NAME'] ?></p>
</body>

</html>