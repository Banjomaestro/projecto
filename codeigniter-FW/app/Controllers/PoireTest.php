<?php

namespace App\Controllers;


use App\Models\IdModel;

class PoireTest extends BaseController
{
    public function index()
    {

        ////////////////////////////////////////////////////
        ////////////////////////////////////////////////////

        /*VERIFICATION IDModel*/

        $modelID = model(IdModel::class);

        $modelID->subscribe('hola','hola');

        $modelID->changeMdp('hola', 'hello');


        //Vérification des Check

        if ($modelID->identifiantCheck('hola')==true){
            echo " L'identifiant existe. ";
        }
        else {
            echo " L'identifiant n'existe pas. ";
        }
        
        if ($modelID->mdpCheck('hola', 'hello')==true){
            echo ' Le mdp hello existe. ';
        }
        else {
            echo " Le mdp hello n'existe pas. ";
        }

        if ($modelID->mdpCheck('hola', 'hola')==true){
            echo ' Le mdp hola existe. ';
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
        $modelID->deleteIDModel('hola');


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

        // $key='102';

        // $modelR->newResponse('La chocolatine',' ','7');

        // $modelR->modifyResponseLibelle('2','Le pain au chocolat');

        // $modelR->modifyResponsePhoto($key,'');

        //$modelR->deleteResponse($key);


        ///////////////////////////////////////////////////
        ///////////////////////////////////////////////////

    }
}
