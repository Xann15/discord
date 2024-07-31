<?php

class Router
{
    private $routes = [];

    public function add($pattern, $callback)
    {
        $pattern = trim($pattern, '/') . '/?';
        // Gunakan regex yang lebih umum untuk mencocokkan ID terenkripsi
        $pattern = preg_replace('/\{[a-zA-Z0-9_]+\}/', '(.+)', $pattern);
        $this->routes[$pattern] = $callback;
    }

    public function dispatch($url)
    {
        $url = trim(parse_url($url, PHP_URL_PATH), '/');
        // Debugging
        // echo "Requested URL: /$url<br>";
        foreach ($this->routes as $pattern => $callback) {
            // Debugging
            // echo "Checking pattern: $pattern<br>";
            if (preg_match("#^$pattern$#", $url, $matches)) {
                array_shift($matches); // Remove the full match
                // Debugging
                // echo "Pattern matched: $pattern<br>";
                // Debugging
                // echo "Callback: $callback<br>";
                return $this->callCallback($callback, $matches);
            }
        }
        // Debugging
        // echo "404 Not Found<br>";
    }

    private function callCallback($callback, $params)
    {
        list($controller, $method) = explode('@', $callback);
        require_once __DIR__ . "/Controllers/{$controller}/{$controller}.php";
        if (!class_exists($controller)) {
            die("Controller class $controller not found");
        }
        $controller = new $controller;
        if (!method_exists($controller, $method)) {
            die("Method $method not found in controller $controller");
        }
        call_user_func_array([$controller, $method], $params);
    }
}
