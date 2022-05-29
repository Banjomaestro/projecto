<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Bienvenue sur le quiz !</title>
	<meta name="description" content="The small framework with powerful features">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/png" href="/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/CSS/stylesRes.css" type="text/css">

	
<!-- CONTENT -->

<section>
	<div class = "head" >
		<h1>Bienvenue sur le quiz !</h1>
	</div>
	
	<div class = "titre">
		<p>Vous allez bientot découvir qui est votre patronus :)</p>
	</div>
	
	<div class = "container" >
		<?php $session = \Config\Services::session(); 
		$session->set('idQ', 1);
		$id = 1; ?>
		<?= '<a href="/Questions/'.$id.'">Let\'s goooooo</a>' ?> 
	</div>

	


</section>

</body>
</html>
