<?php

require_once '../banco/Database.php';

class Admin{
    
    public function Cadastrar() {
        $db = new Database('administrativo');
        $data = [
            'Email'=> "'$this->Email'",
            'Senha'=> "'$this->Senha'",
            'Nome'=> "'$this->Nome'",
        ];

        if (!empty($this->IdCargo)) {
            $data['IdCargo'] = $this->IdCargo;
        }

        return $db->insert($data);
    }

    public function getAdministrativo(){
        return (new Database('administrativo'))->select();
    }
    
}
    