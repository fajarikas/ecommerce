<?php

$servername = "localhost";
$username = "fajarikasaputra";
$password = "170603";
$db = "ecommerce";

// Create connection
$con = mysqli_connect($servername, $username, $password, $db);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
