<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Bienvenue sur le quiz !</title>
	<meta name="description" content="The small framework with powerful features">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/png" href="/favicon.ico"/>

	
<!-- CONTENT -->

<section>

	<h1>Bienvenue sur le quiz !</h1>

	<p>Vous allez bientot découvir qui est votre patronus :)</p>

	<?php $session = \Config\Services::session(); $id = $session->get('id'); ?>
	<?= '<a href="/Questions/QuestionDisplay?id='.$id.'">Let\'s goooooo</a>' ?>


</section>


</body>
</html>
