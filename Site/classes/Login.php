<?php

require_once './banco/Database.php';

class Login extends Database
{
    private $id;

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
    }

    public function validarLogin($email, $senha)
    {
        $login = "";
        $count = 0;

        $conn = Database::setConnection();

        $sql = "SELECT Email, Senha, IdAdministrativo FROM administrativo";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (($email == $row["Email"]) && ($senha == $row["Senha"])) {
                    $login = "administrativo";
                    $this->setId($row["IdAdministrativo"]);
                    $count++;
                }
            }
        }


        $sql = "SELECT Email, Senha, RA FROM aluno";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (($email == $row["Email"]) && ($senha == $row["Senha"])) {
                    $login = "aluno";
                    $this->setId($row["RA"]);
                    $count++;
                }
            }
        }

        $sql = "SELECT Email, Senha, IdProfessor FROM professor";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (($email == $row["Email"]) && ($senha == $row["Senha"])) {
                    $login = "professor";
                    $this->setId($row["IdProfessor"]);
                    $count++;
                }
            }
        }

        $sql = "SELECT Email, Senha, IdEmpresa FROM empresa";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (($email == $row["Email"]) && ($senha == $row["Senha"])) {
                    $login = "empresa";
                    $this->setId($row["IdEmpresa"]);
                    $count++;
                }
            }
        }


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
}
