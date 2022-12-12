<?php
require_once "classes/Login.php";


session_start();

if (isset($_SESSION['administrativo'])) {
    header("location: listaPostAdmin.php");
} else if (isset($_SESSION['aluno'])) {
    header("location: listaPostAluno.php");
} else if (isset($_SESSION['professor'])) {
    header("location: listaPostProfessor.php");
} else if (isset($_SESSION['empresa'])) {
    header("location: listaPostEmpresa.php");
}


if($_SERVER["REQUEST_METHOD"] == "POST"){
    $login = new Login();
    $validar = $login->validarLogin($_POST['email'], $_POST['senha']);

    if ($validar ) {
        if ($validar == 'administrativo') {
            $_SESSION['administrativo'] = TRUE;
            $_SESSION['id'] = $login->getId();
           header("location: listaPostAdmin.php");
        } else if ($validar == 'aluno') {
            $_SESSION['aluno'] = TRUE;
            $_SESSION['id'] = $login->getId();
            header("location: listaPostAluno.php");
        } else if ($validar == 'professor') {
            $_SESSION['professor'] = TRUE;
            $_SESSION['id'] = $login->getId();
            header("location: listaPostProfessor.php");
        } else if ($validar == 'empresa') {
            $_SESSION['empresa'] = TRUE;
            $_SESSION['id'] = $login->getId();
            header("location: listaPostEmpresa.php");
        }
    }
}
?>
 
 <!DOCTYPE html>
<html lang="pt_br">

<head>
    <meta charset="UTF-8">
    <meta name="author" content="Ester Morais, Carol Vantim, Fernando Maldonado">
    <meta name="description" content="Página de login do Mais Ensina">
    <title>Tela de Login</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="upload/styles/login.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>

<body>
    <div class="container">
        <!-- Logo -->
        <div class="logo transformar">
            <img src="./upload/assets/logo-plataforma.svg" width="80px" alt="Logo Mais Ensina">
        </div>
        <!-- End Logo -->

        <!-- Formulário -->
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="mb-3 texto formulario">
                <label for="exampleInputEmail1" class="form-label">Endereço de e-mail</label>
                <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <div class="mb-3 texto formulario">
                <label for="exampleInputPassword1" class="form-label">Sua senha</label>
                <input type="password" name="senha" required class="form-control" id="exampleInputPassword1">
            </div>
            <div class="mb-3 form-check texto formulario">
                <input type="checkbox" required class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Lembrar de mim por 30 dias</label>
            </div>
            <button type="submit" class="btn">Entrar na Plataforma</button>
        </form>
        <!-- End formulário-->

        <!-- Senha -->
        <div class="paragraphs">
            <a href="#">
                <p>Esqueceu sua senha?</p>
            </a>
        </div>
        <!-- End Senha -->

    </div>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <!-- Script -->
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init({
            easing: 'ease-out-back',
            duration: 1000
        });
    </script>
</body>

</html>