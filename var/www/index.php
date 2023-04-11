<?php

$user = 'root';
$pass = 'test';

echo 'Welcome to DOCKER ready to Code with APACHE - PHP - MYSQL & PHPMYADMIN<br><br>';
echo 'Try to connect with PDO to MYSQL:<br>';

try {

    $dbh = new PDO('mysql:host=db;dbname=database', $user, $pass);

    foreach ($dbh->query('SELECT * from Person') as $row) 
    {
       print_r($row);
    }

    $dbh = null;

    echo '<br>PDO with MySQL connected successfully<br><br>';
    echo 'Now you can code<br>';

 } 
 catch (PDOException $e) 
 {

    echo "Error!: " . $e->getMessage() . "<br>";
    die();
 }