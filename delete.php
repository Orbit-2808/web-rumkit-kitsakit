<?php
    include('function.php');

    $id = $_GET['id'];
    // $type = $_GET['type'];
    if ($id > 0) {
        // if($type == 1) $isDeleteSucceed = deleteMenu($id); 
        // else if($type == 2) $isDeleteSucceed = deleteBahan($id);
        // else if($type == 3) $isDeleteSucceed = deleteChef($id);
        $isDeleteSucceed = deleteDokter($id);

        if ($isDeleteSucceed > 0) {
        echo "
        <script>
        alert('Delete Success !');
        document.location.href = 'admin.php';
        </script>
        ";
        } else {
        echo "
        <script>
        alert('Delete Failed !');
        document.location.href = 'admin.php';
        </script>
        ";
    }
    }
?>
