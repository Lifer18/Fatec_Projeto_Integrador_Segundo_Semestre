<?php

require_once '../banco/Database.php';

class Cargo
{
    private $IdCargo;
    private $Cargo;


    public function getCargo()
    {
        return (new Database('cargo'))->select();
    }
}