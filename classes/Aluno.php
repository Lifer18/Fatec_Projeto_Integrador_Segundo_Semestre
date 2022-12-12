<?php

require_once '../banco/Database.php';

class Aluno{

    public function Cadastrar() {
        $db = new Database('aluno');
        $data = [
            'RA'=> "'$this->RA'",
            'Email'=> "'$this->Email'",
            'Senha'=> "'$this->Senha'",
            'Nome'=> "'$this->Nome'",
            'DataNasc'=> "'$this->DataNasc'",
        ];

        if (!empty($this->IdTurma)) {
            $data['IdTurma'] = $this->IdTurma;
        }

        return $db->insert($data);
    }
        
    public function getAlunos(){
        return (new Database('aluno'))->select();
    }

    public function getTurma(){
        return (new Database('turma'))->select();
    }
}
    