<?php

namespace App\Models;

use CodeIgniter\Model;


class teacherModel extends Model
{
    
    protected $table = 'prof';

    protected $allowedFields =['Nom', 'prenom'];

    protected $primaryKey= 'ID_prof';

    //Renvoie toute la table
    public function getAll(){
        return $this->findAll();
    }

    public function getById($id)
    {
        return $this->where(['Id_prof' => $id])->first();
    }


}

?>