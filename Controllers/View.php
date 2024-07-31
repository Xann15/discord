<?php

function view($viewPath, $params = [])
{
    $viewFile = __DIR__ . '/../views/' . str_replace('.', '/', $viewPath) . '.php';

    // Debugging
    // echo "Trying to load view file: $viewFile<br>";

    if (file_exists($viewFile)) {
        extract($params);
        require $viewFile;
    } else {
        die("View file not found: $viewFile");
    }
}
