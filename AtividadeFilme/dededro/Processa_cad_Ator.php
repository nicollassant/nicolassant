<?php
    include_once("conn.php");
    $ator = $_POST['txtAtor'];

    $result_usuario = "INSERT INTO tbAtor(ator) VALUES ('$ator')";
    $resultado_usuario = mysqli_query($conn, $result_usuario);

    if (mysqli_affected_rows($conn) != 0){
        echo "
            <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=index.php'>
            <script type=\"text/javascript\">
                alert(\"Ator cadastrado com sucesso.\");
            <script> 
        ";
    }else{
        echo"
            <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=cadaTORES.php'>
            <script type=\"text/javascript\">
                alert(\"O ator não foi cadastrado com Sucesso.\");
            <script>
        ";
    }
?>