<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Result</title>
</head>
<body>
    <p>Voici ton résultat, ton patronus est : </p> 
    <?php echo $Prenom?>
    <p> </p>
    <?php echo $Nom?>
    <?php echo $Description?>
    <img src="/public/images/<?php $nom ?>.jpg" alt="">
</body>
</html>