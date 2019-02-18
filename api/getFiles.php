<?php

require 'config.php';
require "db.php";

$pdo = getDb();

$sth = $pdo->prepare("SELECT * FROM files");
$sth->execute();

$result = $sth->fetchAll();
echo json_encode($result); ?>