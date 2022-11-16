<?php

require_once './banco/Database.php';

class Aluno{

    public $ra;
    public $email;
    public $senha;
    public $nome;
    public $datanasc;
    
    public function Cadastrar() {
        $db = new Database('aluno');
        return $db->insert([
                            'ra'=> "'$this->ra'",
                            'email'=> "'$this->email'",
                            'senha'=> "'$this->senha'",
                            'nome'=> "'$this->nome'",
                            'datanasc'=> "'$this->datanasc'"
                            ]);
    }
        

    public static function getTodosAlunos(){
        return (new Database('aluno'))->select();
    }
    
}
    