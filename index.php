<?php

require_once 'Router.php';
require_once 'config/config.php';

$router = new Router();

// Menambahkan rute untuk login
$router->add('discord/login', 'LoginController@index');

$router->add('discord/register', 'RegisterController@index');

$router->add('discord/inbox', 'InboxController@index');

$router->add('discord/server/{id}', 'ServerController@show');

$router->dispatch($_SERVER['REQUEST_URI']);
