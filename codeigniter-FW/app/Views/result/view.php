<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/CSS/stylesRes.css" type="text/css">
    <title>Resultat</title>
</head>
<body>
    <div class = "head">
        <h1>Découvre ton patronus !</h1>
    </div>
    <div class = "titre">
        <h2>Voici ton résultat, ton patronus est : </h2> 
    </div>

    <div class = "container">
        <div class = "result">
            <p><?php echo $Prenom?></p>
            <p><?php echo $Nom?> </p>
        </div>
        
        
        <p><img src="<?=URL?>images/prof/<?=$ID_prof?>.jpg" alt="photo de prof"></p>
        
        <div class ="descrip">
            <p><?php echo $Description?></p>
        </div>
        <!-- <img src="/public/images/<?php $Nom ?>.jpg" alt=""> -->
    </div>
    <a href="/start">Retour à l'accueil</a>
    <div class = "titre">
        <h3>Tu veux te déconnecter ?</h3>
        <a href="<?php echo base_url(''); ?>">Déconnexion !</a> 
    </div>  
</body>
</html>