<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Joue avec moi :)</title>
	<meta name="description" content="The small framework with powerful features">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/png" href="/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/CSS/stylesQ.css" type="text/css">

	
<!-- CONTENT -->

<section>
	<div class="head-quiz">
		<div class="head-title">
			<h1>Découvre qui est ton patronus !</h1>
		</div>
		
	</div>
	
	<div class="quiz">
		<div class="question">
			<!-- display of the question -->
			<h2><?= $question['ID_Q'] ?>.<?= $question['Libelle'] ?></h2> 
		</div>
		
		<div class="reponses">
			<!-- form with post method : send the POST to the create function of Questions controller -->
			<form action="/Questions/create" method="post">
				<!-- condeIgniter need to forms -->
				<?= csrf_field() ?>
				<?php foreach($reponses as $oneReponse){?> <!-- display of all the responses of the question -->
					<div class="oneReponse">
						<input type="radio" name="QuestID" value="<?=$oneReponse['ID_rep']?>" required>
						<label for="QuestID"><?= $oneReponse['Libelle'] ?></label> <br>
					<!-- if the response as an image name in database it will display it -->
					<!-- there is no alt because we would see it for responses without images -->
					<img src="<?=URL?>images/quiz/<?=$oneReponse['Photo'] ?>.jpg" alt="">
					
					</div>
				<?php } ?>

				<input class="btn btn-lg btn-success btn-block" type="submit" value="Next question" name="next" > <!-- submit button send the POST request -->
			</form>	
		</div>
	</div>

		

	<?php if($idQ>1){ ?> <!-- previous question not displayed if we are in the first question -->
	<?php $previousid = $idQ-1 ?>
	<?= '<a href="./'.$previousid.'">Previous Question !</a>'?>
	<?php } ?>

   
</section>


</body>
</html>
