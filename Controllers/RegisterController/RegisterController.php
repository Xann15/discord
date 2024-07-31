<?php

require_once   __DIR__ . '/../View.php';

class RegisterController
{
    public function index()
    {
        view('register.index', [
            "title" => "Register Page",
            "logo" => "register.png"
        ]);
    }
}
