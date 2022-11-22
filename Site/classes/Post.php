<?php

require_once './banco/Database.php';

class Post
{

    public $idPost;
    public $titulo;
    public $dataPost;
    public $corpo;
    public $anexo;
    public $idProfessor;

    public function Cadastrar()
    {
        $db = new Database('post');
        return $db->insert([
                            'titulo'=> "'$this->titulo'",
                            'dataPost'=> "'$this->dataPost'",
                            'corpo'=> "'$this->corpo'",
                            'anexo'=> "'$this->anexo'",
                            'idProfessor'=> "'$this->idProfessor'"
                            ]);
    }

    public static function getPost(){
        return (new Database('post'))->select();
    }

}