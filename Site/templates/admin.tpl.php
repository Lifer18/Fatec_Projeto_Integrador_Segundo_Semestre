<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Painel administrativo</title>
    <link rel="stylesheet" href="/resources/fontawesome/css/all.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/trix/trix.css">
    <!-- <link rel="stylesheet" href="/resources/pnotify/pnotify.custom.min.css"> -->
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body class="d-flex flex-column">
    <div id="header">
        <nav class="navbar navbar-dark bg-dark">
            <span>
                <a href="/admin" class="navbar-brand">BLOG</a>
                <span class="navbar-text">
                    Painel administrativo!
                </span>
            </span>
            <a href="/admin/auth/logout" class="btn btn-danger"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
        </nav>
    </div>
    <div id="main">
        <div class="row">
            <div class="col">
                <ul id="main-menu" class="nav flex-column nav-pills bg-secondary text-white p-2">
                    <li class="nav-item">
                        <span class="nav-link text-white-40"><small>Menu</small>
                        </span>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/pages" class="nav-link <?php if (resolve('/admin/pages.*')): ?>active <?php endif; ?>"><i class="far fa-file-alt"></i> Páginas</a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/users" class="nav-link <?php if (resolve('/admin/users.*')): ?>active <?php endif; ?>"><i class="fa-solid fa-users"></i>  Usuários</a>
                    </li>
                </ul>
            </div>
            <div id="content" class="col-10">
                <?php include $content ?>
            </div>
        </div>
    
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/resources/trix/trix.js"></script>
    <!-- <script src="/resources/pnotify/pnotify.custom.min.js"></script> -->
    <script>
        
        document.addEventListener('trix-attachment-add', function () {
            const attachment = event.attachment;
            if (!attachment.file) {
                return;
            }
            const form = new FormData();
            form.append('file', attachment.file);

            $.ajax({
                url: '/admin/upload/image',
                method: 'POST',
                data: form,
                contentType: false,
                processData: false,
                xhr: function () {
                    const xhr = $.ajaxSettings.xhr();
                    xhr.upload.addEventListener('progress', function (e) {
                        let progress = e.loaded / e.total * 100;
                        attachment.setUploadProgress(progress);
                    })

                    return xhr;
                }
            }).done(function (response) {
                console.log(response);
                attachment.setAttributes({
                    url: response,
                    href: response
                });
            }).fail(function () {
                console.log('deu errado');
            });
        });


        <?php flash(); ?>

        const confirmEl = document.querySelector('.confirm');

        if (confirmEl) {
            confirmEl.addEventListener('click', function(e) {
                e.preventDefault();
                if (confirm('Tem certeza que quer fazer isso?')) {
                    window.location = e.target.getAttribute('href');
                }
            });
        }
    </script>
  </body>
</html>