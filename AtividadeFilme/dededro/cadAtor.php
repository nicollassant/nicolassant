<?php
    include_once("conn.php");
?>
 <!DOCTYPE html>
<head>
    <title>Cadastro</title> 
    <meta charset="utf-8">
</head>
</body>

    <form method="POST" action="Processa_cad_atorFilme.php">

        <select name="selectAtor">
        <option>Selecione</option>
            <?php

                $result_niveis_acessos = "SELECT * FROM tbAtor";
                $resultado_niveis_acesso =  mysqli_query($conn, $result_niveis_acessos);
                while ($row_niveis_acessos = mysqli_fetch_assoc($resultado_niveis_acesso)){ ?>
            <option value="<?php echo $row_niveis_acessos['codAtor']; ?>"><?php echo $row_niveis_acessos['ator']; ?></option> <?php
            
            }
            
            ?>
    </select>
    <br><br>
    <select name="selectFilme">
    <option>Selecione</option> 
        <?php
        
        $result_niveis_acessos = "SELECT * FROM tbFilme";
        $resultado_niveis_acesso = mysqli_query($conn, $result_niveis_acessos);
        while($row_niveis_acessos = mysqli_fetch_assoc($resultado_niveis_acesso)){ ?>
        <option value="<?php echo $row_niveis_acessos['codFilme']; ?>"><?php echo $row_niveis_acessos['filme']; ?></option> <?php
        
        }
        
        ?>
    
    </select><br><br>
    
    <input type="submit" value="Cadastrar">
    
    </form>
    
 </body>  
</html>