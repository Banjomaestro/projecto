<?php

namespace App\Models;

use CodeIgniter\Model;


class questionModel extends Model
{
    protected $table = 'question';

    protected $allowedFields =['Libelle'];

    protected $primaryKey= 'ID_Q';

    protected $useAutoIncrement = true;


    //Renvoie un tableau avec les libelés de chaque question
    public function getAllQuestions()
    {
        return $this->findColumn('Libelle');
    }

    //Renvoie le libelé d'une question en fonction de son id
    public function getQuestion($id)
    {
        return $this->where(['ID_Q'=>$id])->findColumn('Libelle');
    }

}
