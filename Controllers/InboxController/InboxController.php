<?php

require_once __DIR__ . '/../View.php';

class inboxController
{
    public function index()
    {
        view('inbox.index', [
            "title" => "Inbox Cuy",
            "logo" => "s"
        ]);
    }
}
