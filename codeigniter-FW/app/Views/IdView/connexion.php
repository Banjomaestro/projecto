<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Connexion</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen" title="no title">
  </head>
  <body>

    <div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Connectez-vous ici</h3>
                </div>
             <?php
             // $success_msg= $this->session->flashdata('success_msg');
             // $error_msg= $this->session->flashdata('error_msg');

                /*  if($success_msg){
                    ?>
                    <div class="alert alert-success">
                      <?php echo $success_msg; ?>
                    </div>
                  <?php
                  }
                  if($error_msg){
                    ?>
                    <div class="alert alert-danger">
                      <?php echo $error_msg; ?>
                    </div>
                    <?php
                  }*/
                  ?>

                <div class="panel-body">
                    <form role="form" method="post" action="<?php echo base_url('/start'); ?>"> <!--ex:'internaute/connexion_internaute' renvoie vers la page de Benjamin-->
                    <?= csrf_field() ?>

                        <fieldset>
                            <div class="form-group"  >
                                <input class="form-control" placeholder="Identifiant" name="Identifiant" type="text" required autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Entrez un mot de passe" name="user_password" type="password" value="" required>
                            </div>

                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Connexion" name="connexion" >

                        </fieldset>
                    </form>
                <b>Vous n'avez pas de compte?</b> <br></b><a href="<?php echo base_url('IdView/inscription'); ?>">Inscrivez-vous ici</a><!--for centered text-->
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>