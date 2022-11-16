<?php
require_once './banco/Database.php';

class Login extends Database
{

    public function validarLogin($email, $senha)
    {
        $login = "";
        $count = 0;

        $conn = database::conectar();

        $sql = "SELECT Email, Senha FROM administrativo";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "Administrativo <br>";
                if (($email == $row["Email"]) && ($senha == $row["Senha"])) {
                    echo "Entrou no IF! <br><br>";
                    $login = "administrativo";
                    $count++;
                }
            }
        }


        /*$sql = "SELECT Email, Senha FROM aluno";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (($email == $row["Email"]) && ($senha == $row["Senha"])) {
                    $login = "aluno";
                    $count++;
                }
            }
        }

        $sql = "SELECT Email, Senha FROM professor";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (($email == $row["Email"]) && ($senha == $row["Senha"])) {
                    $login = "professor";
                    $count++;
                }
            }
        }

        $sql = "SELECT Email, Senha FROM empresa";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (($email == $row["Email"]) && ($senha == $row["Senha"])) {
                    $login = "empresa";
                    $count++;
                }
            }
        }*/


        if (!$conn) {
            return false;
        }

        $conn->close();

        if ($count < 2) {
            return $login;
        } else {
            return false;
        }
    }



    /*public function getLoginAluno($email, $senha){
        
        $email = filter_input(INPUT_POST, 'email');
        $senha = filter_input(INPUT_POST, 'senha');

        if(is_null($email) or is_null($senha)){
            return false;
        }

        $db = new Database('aluno');
        return $db->select("email = '$email'");

        if(!$db){
            return false;
        }

        if (password_verify($senha, $db['senha'])){
            unset($db['senha']);
            $_SESSION['auth'] = $db;
            return true;
        }
        return false;

    }

    public function getProfessor($email){
        return (new Database('professor'))->select("email = '$email'");
    }

    public function getEmpresa($email){
        return (new Database('empresa'))->select("email = '$email'");
    }*/
}
