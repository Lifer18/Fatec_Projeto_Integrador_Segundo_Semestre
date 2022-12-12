<?php

require_once(realpath(dirname(__FILE__) . '/../banco/Database.php'));

class Post extends Database
{

    public function contarPosts()
    {
        $conn = Database::setConnection();

        $sql = 'SELECT MAX(IdPost) FROM post;';

        $result = $conn->query($sql);

        $result = $result->fetch_array();

        $retorno = intval($result[0]);

        $conn->close();

        return $retorno + 1;
    }


    public function cadastrarPost($titulo, $corpo, $anexo, $idturma, $tipo, $id)
    {
        date_default_timezone_set('America/Sao_Paulo');
        $datapost = date('Y-m-d H:i:s');

        $conn = Database::setConnection();

        $sql = 'CALL postseletivo("' . $titulo . '","' . $datapost . '","' . $corpo . '","' . $anexo . '",' . $idturma . ',"' . $tipo . '",' . $id . ');';

        $conn->query($sql);

        $conn->close();
    }

    public function selectAluno($id, $ida)
    {
        $conn = Database::setConnection();
        $sql = "CALL mostrarpostaluno(" . $id . "," . $ida . ")";

        $result = $conn->query($sql);

        if (!is_bool($result)) {
            $retorno = [];
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $retorno[0] = $row['Titulo'];
                    $retorno[1] = $row['DataPost'];
                    $retorno[2] = $row['Corpo'];
                    $retorno[3] = $row['Anexo'];
                    $retorno[4] = $row['Curso'];
                    $retorno[5] = $row['Autor'];
                }
            }
        }
        else{
            $retorno = 0;
        }
        return $retorno;
        $conn->close();
    }

    public function selectAdministrativo($id)
    {
        $conn = Database::setConnection();
        $sql = "CALL mostrarpostadministrativo(" . $id . ")";

        $result = $conn->query($sql);

        if (!is_bool($result)) {
            $retorno = [];
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $retorno[0] = $row['Titulo'];
                    $retorno[1] = $row['DataPost'];
                    $retorno[2] = $row['Corpo'];
                    $retorno[3] = $row['Anexo'];
                    $retorno[4] = $row['Curso'];
                    $retorno[5] = $row['Autor'];
                }
            }
        }
        else{
            $retorno = 0;
        }
        return $retorno;
        $conn->close();
    }

    public function selectEmpresa($id, $ide)
    {
        $conn = Database::setConnection();
        $sql = "CALL mostrarpostempresa(" . $id . "," . $ide . ")";

        $result = $conn->query($sql);

        if (!is_bool($result)) {
            $retorno = [];
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $retorno[0] = $row['Titulo'];
                    $retorno[1] = $row['DataPost'];
                    $retorno[2] = $row['Corpo'];
                    $retorno[3] = $row['Anexo'];
                    $retorno[4] = $row['Curso'];
                    $retorno[5] = $row['Autor'];
                }
            }
        }
        else{
            $retorno = 0;
        }
        return $retorno;
        $conn->close();
    }

    public function selectProfessor($id, $idp)
    {
        $conn = Database::setConnection();
        $sql = "CALL mostrarpostprofessor(" . $id . "," . $idp . ")";

        $result = $conn->query($sql);

        if (!is_bool($result)) {
            $retorno = [];
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $retorno[0] = $row['Titulo'];
                    $retorno[1] = $row['DataPost'];
                    $retorno[2] = $row['Corpo'];
                    $retorno[3] = $row['Anexo'];
                    $retorno[4] = $row['Curso'];
                    $retorno[5] = $row['Autor'];
                }
            }
        }
        else{
            $retorno = 0;
        }
        return $retorno;
        $conn->close();
    }
}
