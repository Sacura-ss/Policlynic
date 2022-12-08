<?php
/*
session_start();
unset($_SESSION['user']);
header('Location: http://localhost:8000');*/

class Controller_logout extends Controller
{
    function __construct()
    {
        $this->model = new Model();
        $this->view = new View();
    }

    function action_index()
    {
        session_start();
        unset($_SESSION['user']);
        header('Location: http://localhost:8000');

    }

}