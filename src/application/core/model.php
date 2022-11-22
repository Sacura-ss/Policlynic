<?php

class Model
{
    // подключение к бд
    protected $mysqli;

    function __construct()
    {
        $this->mysqli = new mysqli("db", "user", "password", "Polyclinic");
        if ($this->mysqli->connect_error){
            die("Connection failed: ". $this->mysqli->connect_error);
        }
    }

    public function get_data()
    {
    }
}