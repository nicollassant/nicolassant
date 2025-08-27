<?php
    include_once("conn.php");
    $genero = $_POST['txtGenero'];

    $result_usuario = "INSERT INTO tbgenerofilme(generoFilme) VALUES ('$genero')";
    $resultado_usuario = mysqli_query($conn, $result_usuario);

    if (mysqli_affected_rows($conn) != 0){
        echo "
            <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=index.php'>
            <script type=\"text/javascript\">
                alert(\"Gênero cadastrado com sucesso.\");
            <script> 
        ";
    }else{
        echo"
            <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=cadaTORES.php'>
            <script type=\"text/javascript\">
                alert(\"O Gênero não foi cadastrado com Sucesso.\");
            <script>
        ";
    }
?>