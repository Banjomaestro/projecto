<?php

namespace App\Controllers;

use CodeIgniter\Model;

class PoireTest extends BaseController
{
    public function index()
    {

        ////////////////////////////////////////////////////
        ////////////////////////////////////////////////////

        /*VERIFICATION IDModel*/

        $modelID = model(IdModel::class);

        $modelID->subscribe('hola',md5('hola'));

        $modelID->changeMdp('hola', md5('hello'));


        //Vérification des Check

        if ($modelID->identifiantCheck('hola')){
            echo " L'identifiant existe. ";
        }
        else {
            echo " L'identifiant n'existe pas. ";
        }
        
        if ($modelID->mdpCheck('hola', md5('hello'))){
            echo ' Le mdp hello existe. ';
        }
        else {
            echo " Le mdp hello n'existe pas. ";
        }

        if ($modelID->mdpCheck('hola', md5('hola'))){
            echo "Le mdp hola existe.";
        }
        else {
            echo " Le mdp hola n'existe pas. ";
        }
        

        //Vérification des GET

        $idTab=$modelID->getAll();

        foreach($idTab as $id)
        {
            foreach($id as $value){
                echo $value;
            };
            echo "\n"; 
        }

        echo "\n";

        echo $modelID->getById('hola')['Identifiant'];
        echo $modelID->getById('hola')['mdp'];


        //Vérification suppression
       // $modelID->deleteIDModel('hola');


        ///////////////////////////////////////////////////
        ///////////////////////////////////////////////////


        /*VERIFICATION questionModel*/

        // $modelQ=model(questionModel::class);

        // $questionTab=$modelQ->getAll();

        // foreach($questionTab as $question)
        // {
        //     echo $question['Libelle']."\n";
        // }

        // echo $modelQ->getByKey('1')['Libelle'];

        
        ///////////////////////////////////////////////////
        ///////////////////////////////////////////////////


        /*VERIFICATION responseModel*/

        // $modelR=model(reponseModel::class);

        // $lesRepALaQuestion=$modelR->getByQuestion('2');

        // foreach($lesRepALaQuestion as $rep)
        // {
        //     echo $rep['Libelle']; 
        // }

        // echo $modelR->getByKey('16')['Libelle'];


        ///////////////////////////////////////////////////
        ///////////////////////////////////////////////////

        
        /*VERIFICATION quizzInternauteModel*/

        // $modelQI=model(quizzInternauteModel::class);
        
        // //On lui crée ses réponses
        // //Q1
        // $modelQI->createQuizzInternaute('joseph','5');
        // //Q2
        // $modelQI->createQuizzInternaute('joseph','7');
        // //Q3
        // $modelQI->createQuizzInternaute('joseph','11');
        // //Q4
        // $modelQI->createQuizzInternaute('joseph','19');
        // //Q5 
        // $modelQI->createQuizzInternaute('joseph','24');
        // //On vérifie que ça écrase bien le ID_rep
        // $modelQI->createQuizzInternaute('joseph','25');
        // //Q6
        // $modelQI->createQuizzInternaute('joseph','29');
        // //Q7
        // $modelQI->createQuizzInternaute('joseph','33');
        // //Q8
        // $modelQI->createQuizzInternaute('joseph','37');
        // //Q9
        // $modelQI->createQuizzInternaute('joseph','45');
        // //Q10
        // $modelQI->createQuizzInternaute('joseph','51');
        // //Q11
        // $modelQI->createQuizzInternaute('joseph','60');
        // //Q12
        // $modelQI->createQuizzInternaute('joseph','74');

        // if ($modelQI->allQuestionsAnswered('joseph'))
        // {
        //     echo 'Joseph a tout bien répondu';
        // }
        // else
        // {
        //     echo "Joseph n'a pas tout répondu";
        // }

        // if ($modelQI->allQuestionsAnswered('joseph'))
        // {
        //     echo 'Joseph a tout bien répondu';
        // }
        // else
        // {
        //     echo "Joseph n'a pas tout répondu";
        // }

        // $modelQI->deleteInternauteResponse('joseph','5');


        // $modelQI->deleteAllInternauteResponses('joseph');

    }
}
