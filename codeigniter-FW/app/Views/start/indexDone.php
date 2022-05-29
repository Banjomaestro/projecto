<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/CSS/stylesRes.css" type="text/css">
    <title>Accueil</title>
</head>
<body>
    <div class = "head">
        <h1>Découvre qui est ton patronus !</h1>
    </div>
    <div class = "titre">
        <h2>Te revoilà ! Ton résultat est : </h2>
    </div>
    <div class = "container">
        <div class = "result">
           <p><?php echo $Prenom?></p>
            <p> <?php echo $Nom?></p>
            <p><img src="<?=URL?>images/prof/<?=$ID_prof?>.jpg" alt="photo de prof"></p>
            <!-- <p><link rel="image prof" type="image/jpg" href="/images/9.jpg"/></p> -->
            <p><?php echo $Description?></p> 
        </div>
    </div>

    <div class = "titre">
        <h3>Tu veux refaire le quizz ?</h3>
        <a href="Quiz">Recommencer !</a>
    </div>   
    <div class = "titre">
        <h3>Tu veux te déconnecter ?</h3>
        <a href="<?php echo base_url(''); ?>">Déconnexion !</a> 
    </div>       
            
        
    
</body>
</html>
