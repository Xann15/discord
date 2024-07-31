<?php

require_once __DIR__ . '/../View.php';

class LoginController
{
    public function index()
    {
        view('login.index', [
            "title" => "Login Page",
            "logo" => "login.png"
        ]);
    }
}
