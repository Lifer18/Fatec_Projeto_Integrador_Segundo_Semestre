<?php
require_once "classes/Login.php";

if($_SERVER["REQUEST_METHOD"] == "POST"){
    session_start();
    $login = new Login();
    $validar = $login->validarLogin($_POST['email'], $_POST['senha']);

    if ($validar ) {
        if ($validar == 'administrativo') {
            $_SESSION['administrativo'] = TRUE;
            header("location: inicio.php");
        } else if ($validar == 'aluno') {
            $_SESSION['aluno'] = TRUE;
            header("location: inicioaluno.php");
        } else if ($validar == 'professor') {
            $_SESSION['professor'] = TRUE;
            header("location: inicioprofessor.php");
        } else if ($validar == 'empresa') {
            $_SESSION['empresa'] = TRUE;
            header("location: inicioempresa.php");
        }
    } else {
        $_SESSION['administrativo'] = FALSE;
        $_SESSION['aluno'] = FALSE;
        $_SESSION['professor'] = FALSE;
        $_SESSION['empresa'] = FALSE;
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
        body {
            font: 14px sans-serif;
        }

        .title {
            text-align: center;
            margin-top: 30px;
        }

        .wrapper {
            width: 350px;
            padding: 20px;
            margin: auto;
            margin-top: 50px;
        }
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
            </div>
            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="senha" class="form-control" value="">

            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary mb-3 p-3">
                    <h5>Entrar</h5>
                </button>
            </div>
        </form>
    </div>
</body>

</html>