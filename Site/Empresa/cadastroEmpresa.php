<?php
    session_start(); // initial session

    if(!isset($_SESSION["administrativo"]) || $_SESSION["administrativo"] !== true){ // se não existir loggedin no session ou loggedin não estuver valido volta para index.php
        header("location: index.php");
        exit;
    }

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        if( $_POST['cnpj'] != "" && $_POST['nome'] != "" && $_POST['endereco'] != "" && $_POST['email'] != "" && $_POST['senha'] != "")  { 
            
            require_once('../classes/Empresa.php');
            $empresa = new Empresa();

            $empresa->cnpj = $_POST['cnpj'];
            $empresa->nome = $_POST['nome'];
            $empresa->endereco = $_POST['endereco'];
            $empresa->email = $_POST['email'];
            $empresa->senha = $_POST['senha'];

            $empresa->Cadastrar();

            header("location: listaEmpresa.php");
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
            <li><a class="dropdown-item" href="../Professor/cadastroProfessor.php">Cadastro Professor</a></li>
            <li><a class="dropdown-item" href="../Aluno/listaAluno.php">Cadastro Aluno</a></li>
            <li><a class="dropdown-item" href="listaEmpresa.php">Cadastro Empresa</a></li>
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
    <div class="wrapper">
        <h2>Cadastro de empresa</h2>
        <form action="cadastroEmpresa.php" method="POST">
            <div class="form-group">
                <label>CNPJ</label>
                <input type="text" name="cnpj" class="form-control" value="">
                <span class="help-block"></span>
            </div>    
            <div class="form-group">
                <label>Nome</label>
                <input type="text" name="nome" class="form-control" value="">
                <span class="help-block"></span>
            </div>
            <div class="form-group">
                <label>Endereco</label>
                <input type="text" name="endereco" class="form-control" value="">
                <span class="help-block"></span>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="">
                <span class="help-block"></span>
            </div>
            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="senha" class="form-control" value="">
                <span class="help-block"></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Cadastrar">
            </div>
        </form>
    </div>  
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>