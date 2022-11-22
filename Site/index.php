<?php
require_once "classes/Login.php";


session_start();

if (isset($_SESSION['administrativo'])) {
    header("location: dashboard.php");
} else if (isset($_SESSION['aluno'])) {
    header("location: dashboardAluno.php");
} else if (isset($_SESSION['professor'])) {
    header("location: dashboardProfessor.php");
} else if (isset($_SESSION['empresa'])) {
    header("location: dashboardEmpresa.php");
}


if($_SERVER["REQUEST_METHOD"] == "POST"){
    $login = new Login();
    $validar = $login->validarLogin($_POST['email'], $_POST['senha']);

    if ($validar ) {
        if ($validar == 'administrativo') {
            $_SESSION['administrativo'] = TRUE;
            $_SESSOIN['id'] = $login->getId();
            header("location: dashboard.php");
        } else if ($validar == 'aluno') {
            $_SESSION['aluno'] = TRUE;
            $_SESSOIN['id'] = $login->getId();
            header("location: dashboardAluno.php");
        } else if ($validar == 'professor') {
            $_SESSION['professor'] = TRUE;
            $_SESSOIN['id'] = $login->getId();
            header("location: dashboardProfessor.php");
        } else if ($validar == 'empresa') {
            $_SESSION['empresa'] = TRUE;
            $_SESSOIN['id'] = $login->getId();
            header("location: dashboardEmpresa.php");
        }
    }
}
?>
 
<!DOCTYPE html>
<html lang="pt_BR">
<head>
    <meta charset="UTF-8">
    <title>Acessar</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .title{text-align: center; margin-top:30px;}
        .wrapper{ width: 350px; padding: 20px; margin: auto; margin-top: 50px;}
    </style>
</head>
<body>
    <h1 class="title">Login</h1>
    <div class="wrapper">
        <h2>Acessar</h2>
        <p>Favor inserir login e senha.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group">
                <label>Usuário</label>
                <input type="email" name="email" class="form-control" value="">
                <span class="help-block"></span>
            </div>    
            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="senha" class="form-control" value="">
                <span class="help-block"></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Acessar">
            </div>
        </form>
    </div>    
</body>
</html>