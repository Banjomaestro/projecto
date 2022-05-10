<?php

namespace App\Models;

use App\Models\IdModel;
use App\Models\reponseModel;

class quizzInternauteModel extends Model
{
    protected $table = 'quizz_Internaute';

    protected $allowedFields =['ID_ident','ID_rep'];

    protected $primaryKey= array('ID_ident','ID_rep');


    /*VERIFIE SI L'INTERNAUTE A DEJA REPONDU*/

    public function answered($id_ident,$id_q){

        $query=$this->where(['ID_ident'=>$id_ident])->findAll();

        $rep = model(reponseModel::class);

        $query=$rep->getByQuestion($id_q);

        $size=count($query);

        if($size>0)
        {
          return true;
        }
        else
        {
          return false;
        }
    }


    /*NOUVEAU*/
    
}