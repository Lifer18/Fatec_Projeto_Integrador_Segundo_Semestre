<?php

require_once '../banco/Database.php';

class Empresa{

    public $idEmpresa;
    public $cnpj;
    public $nome;
    public $endereco;
    public $email;
    public $senha;

    public function Cadastrar() {
        $db = new Database('empresa');
        return $db->insert([
                            'cnpj'=> "'$this->cnpj'",
                            'nome'=> "'$this->nome'",
                            'endereco'=> "'$this->endereco'",
                            'email'=> "'$this->email'",
                            'senha'=> "'$this->senha'"
                            ]);
    }
        
      
    public static function getAll(){
    return (new Database('empresa'))->select();
    }
    
}
    