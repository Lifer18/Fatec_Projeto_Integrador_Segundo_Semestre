<?php

function get_user() {
    return $_SESSION['auth'] ?? null;
}

function auth_protection() {
    $user = get_user();

    if (!$user and !resolve('/admin/auth.*')) {
        header('Location: /admin/auth/login');
        die();
    }

    function logout() {
        unset($_SESSION['auth']);
        flash('Deslogado com sucesso!');
        header('location: /admin/auth/login');
        die();
    }
}