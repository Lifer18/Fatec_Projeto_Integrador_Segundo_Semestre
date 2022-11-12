<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Painel administrativo</title>
    <link rel="stylesheet" href="/resources/fontawesome/css/all.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/trix/trix.css">
    <link rel="stylesheet" href="/css/style.css">
  </head>

  <body class="d-flex flex-column">
    
    <div id="main">
        <div class="row justify-content-center">
            <div id="content" class="col-4 align-self-center">
                <?php include $content ?>

            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script>
        <?php flash(); ?>
    </script>
  </body>
</html>