<?php
     session_start(); // initial session

     if(!isset($_SESSION["administrativo"]) || $_SESSION["administrativo"] !== true){ // se não existir loggedin no session ou loggedin não estuver valido volta para index.php
         header("location: index.php");
         exit;
     }

     if($_SERVER["REQUEST_METHOD"] == "POST"){
         if($_POST['titulo'] != "" && $_POST['dataPost'] != "" && $_POST['corpo'] != "" &&   $_POST['idProfessor'] != "")  { 
            
             require_once('classes/Post.php');
             $postes = new Post();

             $postes->titulo = $_POST['titulo'];
             $postes->dataPost = $_POST['dataPost'];
             $postes->corpo = $_POST['corpo'];
             $postes->idProfessor = $_POST['idProfessor']; 

            $postes->Cadastrar();

            header("location: listaPost.php");
         }
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
            <li><a class="dropdown-item" href="listaProfessor.php">Cadastro Professor</a></li>
            <li><a class="dropdown-item" href="listaAluno.php">Cadastro Aluno</a></li>
            <li><a class="dropdown-item" href="listaEmpresa.php">Cadastro Empresa</a></li>
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

<h3 class="mb-5">Novo Post</h3>

    <form action="criarPost.php" method="POST">
        <br>
        <div class="form-group">
            <label for="pagesTitle">Título</label>
            <input type="text" name="title" id="pagesTitle" class="form-control" required placeholder="Título">
        </div>
        <div class="form-group">
            <label for="pagesTitle">Data</label>
            <input type="date" name="dataPost" id="pagesTitle" class="form-control" placeholder="Data">
        </div>
        <br>
        <div class="trix-content">
            <input id="corpo" type="hidden" name="content">
            <trix-editor input="corpo"></trix-editor>
        </div>
        <br>
        <button type="submit" class="btn btn-primary">Salvar</button>

    </form>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/trix/trix.js"></script>
</body>
</html>