<?php
    session_start(); // initial session

    if(!isset($_SESSION["administrativo"]) || $_SESSION["administrativo"] !== true){ // se não existir loggedin no session ou loggedin não estuver valido volta para index.php
        header("location: index.php");
        exit;
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
    <a class="navbar-brand" href="dashboard.php">Administrador</a>
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
            <li><a class="dropdown-item" href="./Professor/listaProfessor.php">Cadastro Professor</a></li>
            <li><a class="dropdown-item" href="Aluno/listaAluno.php">Cadastro Aluno</a></li>
            <li><a class="dropdown-item" href="Empresa/listaEmpresa.php">Cadastro Empresa</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="listaPost.php">Posts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.php">Sair</a>
        </li>
    </div>
  </div>
</nav>
<h2>Bem vindo</h2>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>