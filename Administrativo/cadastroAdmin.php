<?php
    session_start(); // initial session

    if(!isset($_SESSION["administrativo"]) || $_SESSION["administrativo"] !== true){ // se não existir loggedin no session ou loggedin não estuver valido volta para index.php
        header("location: index.php");
        exit;
    }

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        if($_POST['Email'] != "" && $_POST['Senha'] != "" && $_POST['Nome'] != "" &&  $_POST['IdCargo'] != "")  { 
            
            require_once('../classes/Admin.php');
            $admin = new Admin();

            $admin->Email = $_POST['Email'];
            $admin->Senha = $_POST['Senha'];
            $admin->Nome = $_POST['Nome'];
            $admin->IdCargo = $_POST['IdCargo'];

            $admin->Cadastrar();

            header("location: listaAdmin.php");
        }
    }
      
?>
<!doctype html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Página de tarefas dos alunos do mais ensina">
    <meta name="author" content="Ester Morais, Carol, Fernando">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Cadastro Administrador</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">

    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../upload/styles/sidebars.css" rel="stylesheet">

    <link href="../../upload/styles/dashboard.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>

</head>

<body>
    <main class="d-flex flex-nowrap">


        <!-- Nav-->
        <div class="d-flex flex-column flex-shrink-0 p-3" style="width: 280px; background-color:#121212;">
            <a href="../dashboard.php" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                <div class="rounded-circle me-2" style="background-color: white;">
                    <img src="../upload/assets/logo-plataforma.svg" class="bi pe-none " width="40" height="35" alt="foto de perfil do usuário logado">
                </div>
                <span style="font-weight: bold;" class="fs-4">Mais Ensina</span>
            </a>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="../dashboard.php" class="nav-link text-white" aria-current="page">
                        <img src="../upload/assets/icon-home.svg" class="bi pe-none me-2" width="25" height="25" alt="icon de uma casa branca">
                        Home
                    </a>
                </li>
                <li>
                    <a href="../dashboard.php" class="nav-link text-white">
                        <img src="../upload/assets/icon-perfil.svg" class="bi pe-none me-2" width="25" height="25" alt="icon de um boneco branco">
                        Cadastros
                    </a>
                </li>
                <li>
                    <a href="../criarPostAdministrativo.php" class="nav-link text-white">
                        <img src="../upload/assets/icon-tarefa.svg" class="bi pe-none me-2" width="25" height="25" alt="icon de tarefas representada por bloquinhos">
                        Criar Post
                    </a>
                </li>
            </ul>
            <hr>
            <div>
                  <a href="logout.php" style="text-decoration:none;">
                      <img src="../upload/assets/avatar.svg" alt="foto de perfil do usuário logado" width="32" height="32" class="rounded-circle me-2">
                      <strong style="color: white;">Administrativo</strong> <!-- nome do professor logado -->
                  </a>
              </div>
        </div>
        <!-- End Nav -->

        <div class="b-example-divider b-example-vr"></div>

        <div class="wrapper">
            <div class="container" style="margin: 30px;">
                <h2 class="mb-4">Cadastro de novo Administrador</h2>
                <form action="cadastroAdmin.php" method="POST">
                    <div class="form-group mb-2">
                        <label>Nome:</label>
                        <input type="text" name="Nome" class="form-control" value="">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group mb-2">
                        <label>Email:</label>
                        <input type="email" name="Email" class="form-control" value="">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group mb-4">
                        <label>Senha:</label>
                        <input type="password" name="Senha" class="form-control" value="">
                        <span class="help-block"></span>
                    </div>
                    <select class="form-select" name="IdCargo" aria-label="Default select example">
                      <option selected>Selecione</option>
                      <?php
                        require_once '../classes/Cargo.php';
                        $cargo = new Cargo();
                        $cargos = $cargo->getCargo();
						          while($row_cargos = mysqli_fetch_assoc($cargos)){ ?>
							          <option value="<?php echo $row_cargos['IdCargo']; ?>"><?php echo $row_cargos['Nome']; ?></option> <?php
                      }
					            ?>
                    </select>
                    <div class="form-group">
                        <input type="submit" class="btn btn-dark" value="Cadastrar">
                    </div>
                </form>
            </div>
        </div>

    </main>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

    <script src="../../upload/js/sidebars.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>

</html>

            <div class="form-group">
              <label for="">Cargo</label>
              <select class="form-select" name="IdCargo" aria-label="Default select example">
                <option selected>Selecione</option>
                <?php
                    require_once '../classes/Cargo.php';
                    $cargo = new Cargo();
                    $cargos = $cargo->getCargo();
						      while($row_cargos = mysqli_fetch_assoc($cargos)){ ?>
							      <option value="<?php echo $row_cargos['IdCargo']; ?>"><?php echo $row_cargos['Nome']; ?></option> <?php
                  }
					      ?>
              </select>
            </div>
            <br>
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