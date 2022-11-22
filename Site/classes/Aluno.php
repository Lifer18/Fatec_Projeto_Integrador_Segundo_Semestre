<?php

require_once '../banco/Database.php';

class Aluno{

    public $ra;
    public $email;
    public $senha;
    public $nome;
    public $dataNasc;
    
    public function Cadastrar() {
        $db = new Database('aluno');
        return $db->insert([
                            'ra'=> "'$this->ra'",
                            'email'=> "'$this->email'",
                            'senha'=> "'$this->senha'",
                            'nome'=> "'$this->nome'",
                            'dataNasc'=> "'$this->dataNasc'"
                            ]);
    }
        

    public static function getAlunos(){
        return (new Database('aluno'))->select();
    }
    
}
    