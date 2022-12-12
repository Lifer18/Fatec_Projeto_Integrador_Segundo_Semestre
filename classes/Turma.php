<?php 


require_once(realpath(dirname(__FILE__) . '/../banco/Database.php'));

class Turma extends Database
{
    public function selectTurma($id)
    {
        $conn = Database::setConnection();
        $sql = "SELECT * FROM turma WHERE IdTurma = ".$id."";
        $result = $conn->query($sql);
        $retorno = [];

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $retorno[0] = $row['IdTurma'];
                $retorno[1] = $row['Curso'];
            }
        }

        return $retorno;
    }
}