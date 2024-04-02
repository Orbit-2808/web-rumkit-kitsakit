<?php
    include('function.php');

    $idResepObat = $_GET['id_resep_obat'];
    $idRekamMedis = $_GET['id_rekam_medis'];
    if ($idResepObat > 0) {
        $isDeleteSucceed = deleteResepObat($idResepObat); 

        if ($isDeleteSucceed > 0) {
        echo "
        <script>
            alert('Delete Success !');
            document.location.href = 'resep_obat.php?id=$idRekamMedis';
        </script>
        ";
        } else {
        echo "
        <script>
            alert('Delete Failed !');
            document.location.href = 'resep_obat.php?id=$idRekamMedis';
        </script>
        ";
    }
    }
?>
