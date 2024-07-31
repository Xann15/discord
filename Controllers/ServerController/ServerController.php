<?php

require_once  __DIR__ . '/../View.php';

class ServerController
{
    public function show($id)
    {
        view('server.index', [
            "title" => "Server Page",
            "server_id" => $id
        ]);
    }
}
