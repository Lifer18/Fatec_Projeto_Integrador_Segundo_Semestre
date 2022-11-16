<?php
    session_start();

    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: index.php");
        exit;
    }

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        if( $_POST['name'] != ""  &&   $_POST['sobrenome'] != "" && $_POST['ra'] != "")  { 
            
            require_once('classes/Admin.php');
            $aluno = new Aluno();

            $aluno->nome = $_POST['name'];
            $aluno->sobrenome = $_POST['sobrenome'];
            $aluno->ra = $_POST['ra']; 

            $aluno->Cadastrar();

            header("location: inicio.php");
        }
    }
      
?>
<!DOCTYPE html>
<html lang="pt_BR">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Fatec Araras</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Cadastros
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Cadastro Professor</a></li>
            <li><a class="dropdown-item" href="ListaAluno.php">Cadastro Aluno</a></li>
            <li><a class="dropdown-item" href="#">Cadastro Empresa</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Posts</a>
        </li>
    </div>
  </div>
</nav>
<h2>Alunos Cadastrados</h2>
    <div class="wrapper">
        <div class="content">
            <a href="cadastroAluno.php">Adicionar Aluno</a>
        </div>
        <section class="aluno">
            <table class="data-table">
                <thead>
                    <tr>
                        <th class="text-center">RA</th>
                        <th class="text-center">Nome</th>
                        <th class="text-center">Data de Nascimento</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        require_once('classes/Aluno.php');
                        $aluno = new Aluno();
                        $alunos = $aluno->getTodosAlunos();
                        foreach($alunos as $line){ 
                            $ra = $line['ra'];
                            $nome = $line['nome'];
                            $datanasc = $line['datanasc'];
                            echo "<tr><td>$ra</td><td>$nome</td><td>$datanasc</td></tr>";
                        }
                    ?>
                </tbody>
            </table>
        </section>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>