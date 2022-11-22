<?php
    session_start(); // initial session

    if(!isset($_SESSION["administrativo"]) || $_SESSION["administrativo"] !== true){ // se não existir loggedin no session ou loggedin não estuver valido volta para index.php
        header("location: index.php");
        exit;
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/trix@2.0.0-beta.0/dist/trix.css">
    <script type="text/javascript" src="https://unpkg.com/trix@2.0.0-beta.0/dist/trix.umd.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="../dashboard.php">Administrador</a>
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
            <li><a class="dropdown-item" href="listaProfessor.php">Cadastro Professor</a></li>
            <li><a class="dropdown-item" href="../Aluno/listaAluno.php">Cadastro Aluno</a></li>
            <li><a class="dropdown-item" href="../Empresa/listaEmpresa.php">Cadastro Empresa</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../listaPost.php">Posts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../logout.php">Sair</a>
        </li>
    </div>
  </div>
</nav>

<h3 class="mb-5">Professores</h3>
<div class="wrapper">
        <div class="content">
            <a href="cadastroProfessor.php">Adicionar Professor</a>
        </div>
        <section class="aluno">
            <table class="data-table">
                <thead>
                    <tr>
                        <th class="text-center">Nome</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">Data de Nascimento</th>
                    </tr>
                </thead>
                <tbody>
                    <?php   
                        require_once('../classes/Professor.php');
                        $professor = new Professor();
                        $professores = $professor->getAll();
                        foreach ($professores as $line) {
                            $idProfessor = $line['idProfessor'];
                            $nome = $line['nome'];
                            $email = $line['email'];
                            $dataNasc = $line['dataNasc'];
                            echo "<tr><td>$nome</td><td>$email</td><td>$dataNasc</td><td>";
                        }
                    ?>
                </tbody>
            </table>
        </section>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>