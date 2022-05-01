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

        $key=$modelID->subscribe('hola','hola');

        $modelID->changeMdp($key, 'hello');


        //Vérification des Check

        if ($modelID->identifiantCheck('hola')==true){
            echo " L'identifiant existe. ";
        }
        else {
            echo " L'identifiant n'existe pas. ";
        }
        
        if ($modelID->mdpCheck('hola', 'hello')==true){
            echo ' Le mdp existe. ';
        }
        else {
            echo " Le mdp n'existe pas. ";
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

        echo $modelID->getByKey($key)['Identifiant'];
        echo $modelID->getByKey($key)['mdp'];


        //Vérification suppression
        $modelID->deleteIDModel($key);


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


        /*VERIFICATION reponseModel*/

        $modelR=model(reponseModel::class);

        //$modelR->newResponse('La chocolatine',' ','7');

        ///////////////////////////////////////////////////
        ///////////////////////////////////////////////////

    }
}
