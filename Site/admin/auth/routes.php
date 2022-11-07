<?php

require __DIR__ . '/db.php';

if (resolve('/admin/auth/login')){
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if ($login()){
            flash('Autenticado com Sucesso');
            return header('Location: /admin');
        }
        flash('Email ou senha inválidos!');
    }
    render('admin/auth/login', 'admin/login');

}elseif(resolve('/admin/auth/logout')){
    logout();
}