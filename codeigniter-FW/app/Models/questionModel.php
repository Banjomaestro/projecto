<?php

namespace App\Models;

use CodeIgniter\Model;


class questionModel extends Model
{
    
    protected $table = 'question';

    // public function getQuestions()
    // {

    //     $builder = $this->select('question');
    //     $query = $builder->get();
    //     $result = $query->getResult();

    //     return $result;

    // }

    // public function getAll(){
    //     $builder = $this->select('*');
    //     $query = $builder->get();
    //     $result = $query->getResult();

    //     return $result;
    // }

    public function getQuestion(){

        
        $session = \Config\Services::session();
        $id = $session->get('id');

        $builder = $this->select('*');
        $builder->where('ID_Q', $id);
        $query = $builder->get();
        $result = $query->getResult();

        return $result;
    }

}
