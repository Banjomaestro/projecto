<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <a href="Quiz">restart quizz</a>
        <div>
            <h2>Te revoilà ! Ton résultat est : </h2>
            <p><?php echo $Prenom?></p>
            <p> <?php echo $Nom?></p>
            <?php echo img('/images/9.jpg'); ?>
            <!-- <p><link rel="image prof" type="image/jpg" href="/images/9.jpg"/></p> -->
            <p><?php echo $Description?></p>
            
            
        </div>
    </div>
    
</body>
</html>