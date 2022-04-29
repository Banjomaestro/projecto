//<h2><?= esc($title) ?></h2>

<?= session()->getFlashdata('error') ?>
<?= service('validation')->listErrors() ?>



<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Inscription</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen" title="no title">


  </head>
  <body>

<span style="background-color:red;">
  <div class="container"><!-- container class is used to centered  the body of the browser with some decent width-->
      <div class="row"><!-- row class is used for grid system in Bootstrap-->
          <div class="col-md-4 col-md-offset-4"><!--col-md-4 is used to create the no of colums in the grid also use for medimum and large devices-->
              <div class="login-panel panel panel-success">
                  <div class="panel-heading">
                      <h3 class="panel-title">Inscrivez-vous ici</h3>
                  </div>
                  <div class="panel-body">

                  <?php
                  /*
                  $error_msg=$this->session->flashdata('error_msg');
                  if($error_msg){
                    echo $error_msg;
                  }*/
                   ?>

                    <form action="/IdView/inscription" method="post">
                        <?= csrf_field() ?>

                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Identifiant" name="Identifiant" type="text" required autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Mot de passe" name="mdp" type="password" value="" required>
                            </div>

                            <input class="btn btn-lg btn-success btn-block" type="submit" value="S'inscrire" name="submit" >

                        </fieldset>
                    </form>
                      <b>Vous êtes déjà inscrit?</b> <br></b><a href="<?php echo base_url(''); ?>"> Veuillez-vous connecter</a><!--for centered text-->
                  </div>
              </div>
          </div>
      </div>
  </div>





</span>




  </body>
</html>


