<?php

namespace App\Models;

use CodeIgniter\Model;


class reponseModel extends Model
{
    
    protected $table = 'reponse';

    protected $allowedFields =['Libelle','Photo','ID_R'];

    protected $primaryKey= 'ID_rep';

    protected $useAutoIncrement = true;


    // public function getAll(){
    //     $builder = $this->select('*');
    //     $query = $builder->get();
    //     $result = $query->getResult();

    //     return $result;
    // }


    public function getAnswers(){

        $session = \Config\Services::session();
        $id = $session->get('id');

       
        $builder = $this->select('*');
        $builder->where('ID_Q', $id);
        $query = $builder->get();
        $result = $query->getResult();

        return $result;
    }
}
