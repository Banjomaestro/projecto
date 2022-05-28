<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Result</title>
</head>
<body>
    <h2>Voici ton résultat, ton patronus est : </h2> 
    <p><?php echo $Prenom?></p>
    <p><?php echo $Nom?> </p>
    
    <p><img src="<?=URL?>images/prof/<?=$ID_prof?>.jpg" alt="photo de prof"></p>
    
    <p><?php echo $Description?></p>
    <!-- <img src="/public/images/<?php $Nom ?>.jpg" alt=""> -->

    <a href="/start">Retour à l'accueil</a>
</body>
</html>