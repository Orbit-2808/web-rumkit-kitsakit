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
    
        $query = "SELECT dokter.*, departmen.spesialisasi FROM dokter INNER JOIN departmen ON dokter.id_departmen = departmen.id_departmen";
        $result = mysqli_query($conn, $query);
    
        return $result;
    }

    function readDokterDepartmen($id_departmen){
        global $conn;

        $query = "SELECT * FROM dokter WHERE id_departmen = ".$id_departmen;
        $result = mysqli_query($conn, $query);

        return $result;
    }

    function readRekamMedis(){
        global $conn;

        $query = "SELECT rekam_medis.*, dokter.nama_dokter, pasien.nama_pasien FROM rekam_medis INNER JOIN dokter ON rekam_medis.id_dokter = dokter.id_dokter INNER JOIN pasien ON rekam_medis.id_pasien = pasien.id_pasien ORDER BY tanggal DESC";
        $result = mysqli_query($conn, $query);

        return $result;
    }

    function readObat(){
        global $conn;

        $query = "SELECT * FROM obat";
        $result = mysqli_query($conn, $query);

        return $result;
    }

    function readResepObat($id){
        global $conn;

        $query = "SELECT resep_obat.*, obat.nama_obat, obat.harga FROM resep_obat INNER JOIN obat ON resep_obat.id_obat = obat.id_obat WHERE resep_obat.id_rekam_medis = ".$id;
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

    function countDokter(){
        global $conn;

        $query = "SELECT COUNT(id_dokter) as count FROM dokter";
        $result = mysqli_query($conn, $query);

        $count = mysqli_fetch_assoc($result);

        return $count['count'];
    }
?>