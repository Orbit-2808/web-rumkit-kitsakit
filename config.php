<?php
    $host = 'localhost';
    $username = 'root';
    $password = '';
    $database = 'kitsakit';
    $conn = mysqli_connect($host, $username, $password, $database);

    if(!$conn){
        die ("Koneksi dengan database gagal: ".mysqli_connect_error());
    }else{
        echo 'sukses';
    }
    
?>