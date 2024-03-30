<?php
    include('config.php');

    function readDepartmen(){
        global $conn;

        $query = "SELECT * FROM departmen";
        $result = mysqli_query($conn, $query);

        return $result;
    }
    
    function readDokter(){
        global $conn;
    
        $query = "SELECT * FROM dokter";
        $result = mysqli_query($conn, $query);
    
        return $result;
    }

    function countDepartmen(){
        global $conn;

        $query = "SELECT COUNT(id_departmen) as count FROM departmen";
        $result = mysqli_query($conn, $query);

        $count = mysqli_fetch_assoc($result);

        return $count['count'];
    }
?>