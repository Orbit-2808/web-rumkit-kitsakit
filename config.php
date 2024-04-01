<?php
    $host = 'localhost';
    $username = 'root';
    $password = '';
    $database = 'db_rumah_sakit';
    $conn = mysqli_connect($host, $username, $password, $database);

    if(!$conn){
        die ("Koneksi dengan database gagal: ".mysqli_connect_error());
    }
    
?>