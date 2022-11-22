<?php

require_once '../banco/Database.php';

class Cargo
{
    public $idCargo;
    public $cargo;


    public function getCargo()
    {
        return (new Database('cargo'))->select();
    }
}