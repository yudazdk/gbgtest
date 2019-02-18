<?php

require 'config.php';
require "db.php";

$pdo = getDb();

$num_of_uploaded = $_POST['num_of_uploaded'];

$errorMessages = [];


for ($index = 1; $index <= $num_of_uploaded; $index++  ) {
    $img_name = $_POST['img_name' . $index];

    if ( !preg_match("/^[a-zA-Z]/", $img_name) ) {
        $errorMessages[] = 'img name ' . $index . ' should include only letters';
    }

    $img_description = $_POST['img_description' . $index];
    if ( strlen($img_description) > MAX_IMG_DESCRIPTION_LENGTH) {
        $errorMessages[] = 'img description' . $index . ' xceeds maximum length';
    }

    $ext = pathinfo($_FILES['file_upload' . $index]['name'], PATHINFO_EXTENSION);
    if ( $ext != 'jpg' ) {
        $errorMessages[] = 'file' . $index . '  has illegal extension';
    }

    if ( $_FILES['file_upload' . $index]['size'] > MAX_FILE_SIZE ) {
        $errorMessages[] = 'file' . $index . '  exceeds maximum length';
    }
}


if ( count($errorMessages) > 0 ) {
    http_response_code(400);
    echo json_encode($errorMessages);
    return;
}

for ($index = 1; $index <= $num_of_uploaded; $index++  ) {
    $fileName = 'file_upload' . $index;
    move_uploaded_file($_FILES[$fileName]['tmp_name'], UPLOADS_FOLDER . '/' . $_FILES[$fileName]['name']);

    $img_name = $_POST['img_name' . $index];
    $img_description = $_POST['img_description' . $index];

    $statement = $pdo->prepare('INSERT INTO files (img_name, img_desctiption, file_name) VALUES (:img_name, :img_desctiption, :file_name)');

    $statement->execute(['img_name' => $img_name, 'img_desctiption' => $img_description, 'file_name' => $_FILES[$fileName]['name']]);
}

?>