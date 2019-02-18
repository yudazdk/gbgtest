<?php

require 'config.php';
require "db.php";

$pdo = getDb();

$id = $_POST['id'];

$q = $pdo->prepare("DELETE FROM files WHERE id = ?");
$q->execute(array($id));

$sth = $pdo->prepare("SELECT * FROM files");
$sth->execute();

$result = $sth->fetchAll();
echo json_encode($result); ?>