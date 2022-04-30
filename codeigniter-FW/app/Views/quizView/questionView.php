<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Joue avec moi :)</title>
	<meta name="description" content="The small framework with powerful features">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/png" href="/favicon.ico"/>

	
<!-- CONTENT -->

<section>

	<h1>Découvre qui est ton patronus !</h1>
	
	<?php $id = $_GET['id']; ?>
	<?php $session = \Config\Services::session();  $session->set('id', $id) ?>
	
	<h2><?= $question[0]->ID_Q ?>.<?= $question[0]->Libelle ?></h2>
	
	<?php foreach($reponses as $oneReponse){?>
		<input type="radio" name="questID<?=$oneReponse->ID_Q?>" value="<?=$oneReponse->Libelle?>">
		<?= $oneReponse->Libelle ?> <br>
	<?php } ?>

		

	<?php if($id>1){ ?>
	<?php $previousid = $id-1 ?>
	<?= '<a href="./QuestionDisplay?id='.$previousid.'">Previous Question !</a>'?>
	<?php } ?>
	
	<?php $nextid = $id+1 ?>
	<?php if($id<12){ ?>
	<?= '<a href="./QuestionDisplay?id='.$nextid.'">Next Question !</a>'?>
	<?php } ?>

	

   
</section>


</body>
</html>
