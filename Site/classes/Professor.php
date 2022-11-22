<?php

require_once '../banco/Database.php';

class Professor{

    public $idProfessor;
    public $email;
    public $senha;
    public $nome;
    public $dataNasc;
    public $idCargo;

    public function getIdCargo($idCargo){
        $this->idCargo = $idCargo;
    }

    public function Cadastrar() {
        $db = new Database('professor');
        return $db->insert([  
                            'email'=> "'$this->email'",
                            'senha'=> "'$this->senha'",
                            'nome'=> "'$this->nome'",
                            'dataNasc'=> "'$this->dataNasc'"
                            ]);
    }
        
      
    public static function getAll(){
    return (new Database('professor'))->select();
    }
    
}
    