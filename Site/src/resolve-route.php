<?php

function resolve($route){
    $path = $_SERVER['PATH_INFO'] ?? '/';

    // if (strlen($path) > 1){
    //     $path = rtrim($path, '/');
    // } Utilizar para quando for hospedar

    $route = '/^' . str_replace('/', '\/', $route) . '$/';

    if (preg_match($route, $path, $params)){
        return $params;
    }

    // var_dump($params);
    
    return false;
}