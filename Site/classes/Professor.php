<?php

require_once '../banco/Database.php';

class Professor{

    public function Cadastrar() {
        $db = new Database('professor');
        $data = [
            'Email'=> "'$this->Email'",
            'Senha'=> "'$this->Senha'",
            'Nome'=> "'$this->Nome'",
            'DataNasc'=> "'$this->DataNasc'",
        ];

        if (!empty($this->IdCargo)) {
            $data['IdCargo'] = $this->IdCargo;
        }

        return $db->insert($data);
    }
   
    public static function getProfessor(){
        return (new Database('professor'))->select();
    }   
}
    