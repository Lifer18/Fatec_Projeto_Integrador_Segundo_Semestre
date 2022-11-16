<?php

require_once './banco/Database.php';

class Aluno{

    public $id;

    public $nome;

    public $sobrenome;

    public $ra;

    public function Cadastrar() {
        $db = new Database('aluno');
        return $db->insert([
                            'nome'=> "'$this->nome'",
                            'sobrenome'=> "'$this->sobrenome'",
                            'ra'=> "'$this->ra'"
                            ]);
    }
        
      
    public static function getAll(){
    return (new Database('aluno'))->select();
    }
    
}
    