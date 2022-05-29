<?= session()->getFlashdata('error') ?>
<?= service('validation')->listErrors() ?>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/CSS/stylesRes.css" type="text/css">
    <title>Inscription</title>
  </head>
  <body>
      <div class="head">
          <h1>Inscrivez-vous ici</h1>
      </div>
      <form action="/IdView/inscription" method="post">
        <?= csrf_field() ?>
        <fieldset>
          <div class="titre"  >
            <h3>Identifiant</h3>
            <input class="form-control" placeholder="Identifiant" name="Identifiant" type="text" required autofocus>
            <br>
            <h3>Mot de passe</h3>
            <input class="form-control" placeholder="Entrez un mot de passe" name="mdp" type="password" value="" required>
            <br>  
            <a>                  
            <input class="btn btn-lg btn-success btn-block" type="submit" value="connexion" name="Connexion" > </a>
          </div>
        </fieldset>
      </form>
      <br>
      <div class = "titre">
        <h3>Vous êtes déjà inscrit ?</h3>
        <a href="<?php echo base_url(''); ?>">Connectez-vous ici</a> 
      </div>                     
  </body>
</html>


