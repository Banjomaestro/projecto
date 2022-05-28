<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
</head>
<body>
    <div>
        <h1>Découvre qui est ton patronus !</h1>
        <div>
            <h2>Te revoilà ! Ton résultat est : </h2>
            <p><?php echo $Prenom?></p>
            <p> <?php echo $Nom?></p>
            <p><img src="<?=URL?>images/prof/<?=$ID_prof?>.jpg" alt="photo de prof"></p>
            <!-- <p><link rel="image prof" type="image/jpg" href="/images/9.jpg"/></p> -->
            <p><?php echo $Description?></p>
            
            <h3>Tu veux refaire le quizz ?</h3>
            <a href="Quiz">Recommencer !</a>
            
        </div>
    </div>
   
    
</body>
</html>
