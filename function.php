<?php
    include('config.php');
    
    function readDokter(){
        global $conn;
        
        $query = "SELECT dokter.*, departmen.spesialisasi 
        FROM dokter 
        INNER JOIN departmen 
        ON dokter.id_departmen = departmen.id_departmen";
        $result = mysqli_query($conn, $query);
        
        return $result;
    }

    function readDepartmen(){
        global $conn;

        $query = "SELECT * FROM departmen";
        $result = mysqli_query($conn, $query);

        return $result;
    }

    function readQuery($table, $id, $find){
        global $conn;
        $query = "SELECT * FROM ".$table." WHERE ".$id."=".$find;
        $result = mysqli_query($conn, $query);
        $result = mysqli_fetch_assoc($result);

        return $result;
    };

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

    function readPasien(){
        global $conn;

        $query = "SELECT * FROM pasien";
        $result = mysqli_query($conn, $query);

        return $result;
    }

    function addDokter($data, $file){
        global $conn;

        $namaFoto = $file['foto_dokter']['name'];
        $tempNamaFoto = $file['foto_dokter']['tmp_name'];
        $direktori = 'assets/img/doctors/'.$namaFoto;
        $isMoved = move_uploaded_file($tempNamaFoto, $direktori);
        if(!$isMoved){
            $namaFoto = 'default.jpg';
        }

        $namaDokter = $data['nama_dokter'];
        $jenisKelamin = $data['jenis_kelamin_dokter'];
        $alamat = $data['alamat_dokter'];
        $noTelp = $data['no_telp_dokter'];
        $idDepartmen = $data['departmen'];

        $query = "INSERT INTO dokter VALUES('', '$namaDokter', '$jenisKelamin', '$alamat', '$noTelp', '$namaFoto', '$idDepartmen')";
        $result = mysqli_query($conn, $query);

        $isSucceed = mysqli_affected_rows($conn);

        return $isSucceed;
    }

    function updateDokter($data, $file){
        global $conn;

        $id = $data['id'];
        $namaDokter = $data['nama_dokter'];
        $jenisKelamin = $data['jenis_kelamin_dokter'];
        $alamat = $data['alamat_dokter'];
        $noTelp = $data['no_telp_dokter'];
        $idDepartmen = $data['departmen'];
        $namaFoto = $file['foto_dokter']['name'];

        if($namaFoto != ""){
            $tempNamaFoto = $file['foto_dokter']['tmp_name'];
            $direktori = 'assets/img/doctors/'.$namaFoto;
            move_uploaded_file($tempNamaFoto, $direktori);
            $query = "UPDATE dokter SET nama_dokter = '$namaDokter', jenis_kelamin_dokter = '$jenisKelamin', alamat_dokter = '$alamat', telefon_dokter = '$noTelp', id_departmen = '$idDepartmen', foto='$namaFoto' WHERE id_dokter = '$id'";
            $result = mysqli_query($conn, $query);
        } else{
            $query = "UPDATE dokter SET nama_dokter = '$namaDokter', jenis_kelamin_dokter = '$jenisKelamin', alamat_dokter = '$alamat', telefon_dokter = '$noTelp', id_departmen = '$idDepartmen' WHERE id_dokter = '$id'";
            $result = mysqli_query($conn, $query);
        }

        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }
    
    function deleteDokter($id){
        global $conn;

        $query = "DELETE FROM dokter WHERE id_dokter=$id";
        $result = mysqli_query($conn, $query);

        $isSucceed = mysqli_affected_rows($conn);

        return $isSucceed;
    }
    
    function addObat($data, $file){
        global $conn;

        $namaFoto = $file['foto_obat']['name'];
        $tempNamaFoto = $file['foto_obat']['tmp_name'];
        $direktori = 'assets/img/obat/'.$namaFoto;
        $isMoved = move_uploaded_file($tempNamaFoto, $direktori);
        if(!$isMoved){
            $namaFoto = 'default.jpg';
        }
        
        $namaObat = $data['nama_obat'];
        $deskripsi = $data['deskripsi'];
        $harga = $data['harga'];
        $stok = $data['stok'];
        
        $query = "INSERT INTO obat VALUES ('', '$namaObat', '$deskripsi', '$harga', '$stok', '$namaFoto')";
        $result = mysqli_query($conn, $query);
        
        $isSucceed = mysqli_affected_rows($conn);
        
        return $isSucceed;
    }

    function updateObat($data, $file){
        global $conn;

        $id = $data['id'];
        $namaObat = $data['nama_obat'];
        $deskripsi = $data['deskripsi'];
        $harga = $data['harga'];
        $stok = $data['stok'];
        $namaFoto = $file['foto_obat']['name'];

        if($namaFoto != ""){
            $tempNamaFoto = $file['foto_obat']['tmp_name'];
            $direktori = 'assets/img/obat/'.$namaFoto;
            move_uploaded_file($tempNamaFoto, $direktori);
            $query = "UPDATE obat SET nama_obat = '$namaObat', deskripsi = '$deskripsi', harga = '$harga', stok = '$stok', foto_obat='$namaFoto' WHERE id_obat = '$id'";
            $result = mysqli_query($conn, $query);
        } else{
            $query = "UPDATE obat SET nama_obat = '$namaObat', deskripsi = '$deskripsi', harga = '$harga', stok = '$stok' WHERE id_obat = '$id'";
            $result = mysqli_query($conn, $query);
        }

        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }
    
    function deleteObat($id){
        global $conn;

        $query = "DELETE FROM obat WHERE id_obat = '$id'";
        $result = mysqli_query($conn, $query);

        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }
    
    function addRekamMedis($data){
        global $conn;
        
        $tempTanggal = $data['tanggal'];
        $tanggal = date("Y-m-d H:i:s",strtotime($tempTanggal));
        $diagnosa = $data['diagnosa'];
        $catatan = $data['catatan'];
        $idDokter = $data['dokter'];
        $idPasien = $data['pasien'];
        
        $query = "INSERT INTO rekam_medis VALUES('', '$tanggal', '$diagnosa', '$catatan', '$idDokter', '$idPasien')";
        $result = mysqli_query($conn, $query);
        
        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }

    function updateRekamMedis($data){
        global $conn;

        $id = $data['id'];
        $tempTanggal = $data['tanggal'];
        $tanggal = date("Y-m-d H:i:s",strtotime($tempTanggal));
        $diagnosa = $data['diagnosa'];
        $catatan = $data['catatan'];
        $idDokter = $data['dokter'];
        $idPasien = $data['pasien'];

        $query = "UPDATE rekam_medis SET tanggal = '$tanggal', diagnosa = '$diagnosa', catatan = '$catatan', id_dokter = '$idDokter', id_pasien = '$idPasien' WHERE id_rekam_medis = '$id'";
        $result = mysqli_query($conn, $query);
        
        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }
    
    function deleteRekamMedis($id){
        global $conn;
        
        $query = "DELETE FROM rekam_medis WHERE id_rekam_medis = '$id'";
        $result = mysqli_query($conn, $query);
        
        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }
    
    function addResepObat($data){
        global $conn;
        
        $jumlah = $data['jumlah'];
        $instruksi = $data['instruksi'];
        $idRekamMedis = $data['id_rekam_medis'];
        $idObat = $data['obat'];
        
        $query = "INSERT INTO resep_obat VALUES ('', '$jumlah', '$instruksi', '$idRekamMedis', '$idObat')";
        $result = mysqli_query($conn, $query);
        
        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }

    function updateResepObat($data){
        global $conn;

        $idResepObat = $data['id_resep_obat'];
        $obat = $data['obat'];
        $instruksi = $data['instruksi'];
        $jumlah = $data['jumlah'];

        $query = "UPDATE resep_obat SET instruksi = '$instruksi', jumlah = '$jumlah', id_obat = '$obat' WHERE id_resep_obat = '$idResepObat'";
        $result = mysqli_query($conn, $query);
        
        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }
    
    function deleteResepObat($id){
        global $conn;

        $query = "DELETE FROM resep_obat WHERE id_resep_obat = '$id'";
        $result = mysqli_query($conn, $query);

        $isSucceed = mysqli_affected_rows($conn);
        return $isSucceed;
    }
?>