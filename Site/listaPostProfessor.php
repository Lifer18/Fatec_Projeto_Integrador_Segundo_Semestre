<?php
     session_start(); // initial session

     if(!isset($_SESSION["professor"]) || $_SESSION["professor"] !== true){ // TROCAR AQUI PRA CADA PAGINA
      header("location: index.php");
      exit;
    }

     require_once('classes/Post.php');
      $posts = new Post();
      $count = $posts->contarPosts();

     
?>
<!doctype html>
<html lang="pt-br">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Ester Morais">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Dashboard</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">

    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./upload/styles/sidebars.css" rel="stylesheet">

    <link href="./upload/styles/dashboard.css" rel="stylesheet">

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

      .scroll {
              height: 300px;
              overflow-y: scroll;
          }
    </style>

  </head>

  <body>

    <main class="d-flex flex-nowrap">

      <!-- Nav Siedbar -->
      <div class="d-flex flex-column flex-shrink-0 p-3" style="width: 280px; background-color:#121212;">
              <a href="dashboard.php" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                  <div class="rounded-circle me-2" style="background-color: white;">
                      <img src="./upload/assets/logo-plataforma.svg" class="bi pe-none " width="40" height="35" alt="foto de perfil do usuário logado">
                  </div>
                  <span style="font-weight: bold;" class="fs-4">Mais Ensina</span>
              </a>
              <hr>
              <ul class="nav nav-pills flex-column mb-auto">
                  <li class="nav-item">
                      <a href="listaPostProfessor.php" class="nav-link text-white" aria-current="page">
                          <img src="./upload/assets/icon-home.svg" class="bi pe-none me-2" width="25" height="25" alt="icon de uma casa branca">
                          Home
                      </a>
                  </li>
                  <li>
                      <a href="criarPostProfessor.php" class="nav-link text-white">
                          <img src="./upload/assets/icon-tarefa.svg" class="bi pe-none me-2" width="25" height="25" alt="icon de tarefas representada por bloquinhos">
                          Criar Post
                      </a>
                  </li>
              </ul>
              <hr>
              <div>
                  <a href="logout.php" style="text-decoration:none;">
                      <img src="./upload/assets/avatar.svg" alt="foto de perfil do usuário logado" width="32" height="32" class="rounded-circle me-2">
                      <strong style="color: white;">Professor</strong> <!-- nome do professor logado -->
                  </a>
              </div>
          </div>
          <!-- End Nav Siedbar -->

          <div class="b-example-divider b-example-vr"></div>

      <div class="container">

      <h2 class="mb-5 mt-5">Postagens Gerais</h2>
              <div class="scroll">
                  <div class="postagens" style="display:flex; flex-wrap:wrap; gap:10px">
                      <!-- Pega a data da postagem feita, titulo e nome do professor -->

          <?php
              $posts = new Post;
              while ($count > 0) {
              $line = $posts->selectProfessor($count,$_SESSION['id']);
              if (($line) && ($line != 0)){
          ?>
                      <div class="card mt-2 text-bg-light" style="width: 25rem;">
                          <div class="card-body">
                              <p style="margin-top:8px; font-weight: bold;">Autor:<span style="font-weight: 500;"><?php echo $line[5]."<br>";?><span></p>
                              <p style="margin-top:8px; font-weight: bold;">Curso:<span style="font-weight: 500;"><?php echo $line[4]."<br>";?><span></p>
                              <p style="margin-top:8px; font-weight: bold;">Data:<span style="font-weight: 500;"><?php echo $line[1]."<br>";?><span></p>
                              <br/>
                              <p style="margin-top:8px; font-weight: bold;">Titulo:<span style="font-weight: 500;"><?php echo $line[0]."<br>";?><span></p>
                              <p style="margin-top:8px; font-weight: bold;">Corpo:<span style="font-weight: 500;"><?php echo $line[2]."<br>";?><span></p>
                              <br/>
                              <p style="margin-top:8px; font-weight: bold;">Anexo:<span style="font-weight: 500;"><a href=<?php echo $line[3]?>><?php echo $line[3]."<br>";?></a><span></p>
                          </div>
                      </div>

                      <?php
                      }
                  $count --;   
                          }
                  ?>    

                  </div>
              </div>
      </div>
    </main>
    
  </body>
</html>