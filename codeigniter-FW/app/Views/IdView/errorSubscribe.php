<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/CSS/stylesRes.css" type="text/css">
    <title>Error</title>
</head>
<body>
<div class = "head">
        <h1>Identifiant déjà existant</h1>
</div>
    <div class = "titre">
        <h3>veuillez choisir un autre identifiant</h3>
        <a href="<?php echo base_url('IdView/inscription'); ?>">Inscription</a> 
    </div>  
    <div class = "titre">
        <h2>OU </h2> <br>
    </div>
    <div class = "titre">
        <h3>Connectez-vous ici</h3>
        <a href="<?php echo base_url(''); ?>">Connexion</a> 
    </div> 
    
</body>
</html>
