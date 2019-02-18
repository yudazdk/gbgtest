<?php

function getDb() {
    $host = '127.0.0.1';
    $db   = 'gbg';
    $user = 'root';
    $pass = '';
    $charset = 'utf8mb4';

    try{
        $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
        $pdo = new PDO($dsn, 'root', '');

        return $pdo;
    } catch(PDOException $e){
        return null;
    }
}