<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/CSS/stylesRes.css" type="text/css">
    <title>Connexion</title>
</head>
  <body>
    <div class="head">
         <h1>Découvre dès maintenant qui est ton patronus parmi les profs les plus charismatiques de l'IMAC :)</h1>
    </div>
        <form role="form" method="post" action=""> <!--ex:'internaute/connexion_internaute' renvoie vers la page de Benjamin-->
            <?= csrf_field() ?>
            <fieldset>
                <div class="titre"  >
                    <h3>Identifiant</h3>
                    <input class="form-control" placeholder="Identifiant" name="Identifiant" type="text" required autofocus>
                    <br>
                    <h3>Mot de passe</h3>
                    <input class="form-control" placeholder="Entrez un mot de passe" name="mdp" type="password" value="" required>
                    <br>                  
                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Connexion" name="Connexion" > 
                 </div>
            </fieldset>
        </form>
        <br>
        <div class = "titre">
            <h3>Vous n'avez pas de compte ?</h3>
            <a href="<?php echo base_url('IdView/inscription'); ?>">Inscrivez-vous ici</a> 
        </div>  

</body>
</html>