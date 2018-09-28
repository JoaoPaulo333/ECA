<?php

try {
    $pdo = new PDO('mysql:host=localhost;dbname=db_eca', 'root', '');
    $pdo->exec("set names utf8");
} catch ( PDOException $e ) {
    echo  'Erro ao conectar com o Banco: ' . $e->getMessage();
    exit(1);
}