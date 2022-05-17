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
	
	
	<h2><?= $question['ID_Q'] ?>.<?= $question['Libelle'] ?></h2>

	<form action="/Questions/create" method="post">
	<?= csrf_field() ?>
		<?php foreach($reponses as $oneReponse){?>
			<input type="radio" name="questID" value="<?=$oneReponse['ID_rep']?>" required>
			<?= $oneReponse['Libelle'] ?> <br>
		<?php } ?>

		<input class="btn btn-lg btn-success btn-block" type="submit" value="Next question" name="next" >
	</form>	

		

	<?php if($idQ>1){ ?>
	<?php $previousid = $idQ-1 ?>
	<?= '<a href="./'.$previousid.'">Previous Question !</a>'?>
	<?php } ?>
	
	
	
	

	

   
</section>


</body>
</html>
