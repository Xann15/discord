<?php

require_once 'View.php';

class Controller
{
    public function signin()
    {
        view('signin.index', [
            "title" => "Signin Page",
            "logo" => "signin.png"
        ]);
    }

    public function register()
    {
        view('register.index', [
            "title" => "S Page",
            "logo" => "register.png"
        ]);
    }
    public function sd()
    {
        view('sd.index', [
            "title" => "sd Page",
            "logo" => "sd.png"
        ]);
    }

    public function server($id)
    {
        view('server.index', [
            "title" => "Server Page",
            "server_id" => $id
        ]);
    }
}
