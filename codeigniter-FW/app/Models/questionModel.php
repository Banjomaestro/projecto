<?php

namespace App\Models;

use CodeIgniter\Model;


class questionModel extends Model
{
    protected $table = 'question';

    protected $allowedFields =['Libelle'];

    protected $primaryKey= 'ID_Q';

    protected $useAutoIncrement = true;


    //Renvoie la table
    public function getAll()
    {
        return $this->findAll();
    }

    //Renvoie un tableau des infos d'une question en fonction de sa clé
    public function getByKey($key)
    {
        return $this->where(['ID_Q'=>$key])->first();
    }

}
