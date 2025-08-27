<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filme</title>
</head>
<body>
    <?php

        require_once("conn.php");
    ?>

        <form action="Consultafilme.php" method="post">

            <select name="selectFilmes">

                <option> Selecione</option>

                    <?php

                    $result_niveis_acessos = "SELECT * FROM tbFilme";
                    $resultado_niveis_acesso = mysqli_query ($conn,$result_niveis_acessos); 
                    while($row_niveis_acessos = mysqli_fetch_assoc($resultado_niveis_acesso)){ ?> 
                        <option value="<?php echo $row_niveis_acessos['codFilme'];?>"><?php echo $row_niveis_acessos['filme'];?></option><?php
                    }
                ?>
            </select><br><br> 
            <input type="submit" value="buscar">
        </form>


<?php
$cod = $_POST['selectFilmes'] ?? null;
//$cod = $_POST['selectFilmes'];
$resultado = mysqli_query($conn, "select tbfilme.filme,tbgenerofilme.generofilme,tbdiretorfilme.nomeDiretor from tbfilme, tbgenerofilme, tbdiretorFilme where tbgenerofilme.codGeneroFilme =
tbfilme.codGenero and tbdiretorfilme.codDiretorFilme = tbfilme.codDiretor and tbfilme.codFilme ='".$cod."'");
while($linha = mysqli_fetch_array($resultado))
{
    echo "<br>Filme: ";
    echo $linha['filme'];
    echo "<br>Diretor: ";
    echo $linha['nomeDiretor'];
    echo "<br>Gênero: ";
    echo $linha['generofilme'];
    echo "<br>";

}
$result = mysqli_query($conn,"select tbAtor.ator FROM tbAtor,tbAtorFilme where tbAtor.codAtor=tbAtorFilme.codAtor and tbAtorFilme.codFilme= '".$cod."'");
echo "<br> Elenco: <br>";

while($linha = mysqli_fetch_array($result))
{
    echo $linha['ator'];
    echo "<br>";
}
?>

</body>
</html>