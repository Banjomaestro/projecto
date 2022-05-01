<?php

namespace App\Controllers;


use App\Models\IdModel;

class PoireTest extends BaseController
{
    public function index()
    {


        /*VERIFICATION IDModel*/

        $model = model(IdModel::class);

        $model->subscribe('hola','hola');

        //$model->changeMdp('hola', 'hello');

        //$model->deleteByIdentifiant('hola');


        //Vérification des Check

        if ($model->identifiantCheck('hola')==true){
            echo " L'identifiant existe. ";
        }
        else {
            echo " L'identifiant n'existe pas. ";
        }
        
        if ($model->mdpCheck('hola', 'hello')==true){
            echo ' Le mdp existe. ';
        }
        else {
            echo " Le mdp n'existe pas. ";
        }
        

        //Vérification des GET

        $idTab=$model->getAllIdentifiants();

        foreach($idTab as $id){
            echo $id;
        }

        echo "\n";

        echo $model-> getByIdentifiant('hola')['Identifiant'];
        echo $model-> getByIdentifiant('hola')['mdp'];


        /*VERIFICATION ProfModel*/
        
        $model2 = model(quizzProfModel::class);
        
        print_r( $model2 -> getTeacher(""));

    }
}
