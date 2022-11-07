<?php 

function pages_get_data ($redirectOnError) {
    $title = filter_input(INPUT_POST, 'title');
    $url = filter_input(INPUT_POST, 'url');
    $body = filter_input(INPUT_POST, 'body');

    if (!$title) {
        flash('Informe o campo título', 'error');
        header('Location: ' . $redirectOnError);
        die();
    }

    return compact('title', 'url' , 'body');
}

$pages_all = function () use ($conn){
    $result = $conn->query('SELECT * FROM pages');
    return $result->fetch_all(MYSQLI_ASSOC);
};

$pages_one = function ($id) use ($conn){
    // buscar uma única página
    $sql = 'SELECT * FROM pages WHERE id=?';
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    $result = $stmt->get_result();
    return $result->fetch_assoc();
    
};

$pages_create = function () use ($conn){
    $data = pages_get_data('/admin/pages/create');

    $sql = 'INSERT INTO pages (title, url, body, created, updated) VALUES (?, ?, ?, NOW(), NOW())';

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sss', $data['title'], $data['url'], $data['body']);
    //cadastra uma página
    flash('Registro criado com sucesso!', 'success');

    return $stmt->execute();
};

$pages_edit = function ($id) use ($conn){
    // atualiza uma página
    $data = pages_get_data('/admin/pages' .$id . '/edit');

    $sql = 'UPDATE pages SET title=?, url=?, body=?, updated = NOW() WHERE id=?';

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sssi', $data['title'], $data['url'], $data['body'], $id);
    //cadastra uma página
    flash('Registro alterado com sucesso!', 'success');

    return $stmt->execute();

    
};

$pages_delete = function ($id) use ($conn){
    //remove uma página
    $sql = 'DELETE FROM pages WHERE id=?';

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);
    //cadastra uma página
    flash('Registro removido com sucesso!', 'success');

    return $stmt->execute();
};