<?php

namespace App\Models;

use CodeIgniter\Model;


class quizzProfModel extends Model
{
    
    protected $table = 'quizz_Prof';

    protected $allowedFields =['ID_rep'];

    protected $primaryKey= 'ID_prof';

    protected $useAutoIncrement = true;

    public function getTeacher($answers){

        $index = 0;
        $max = 0;
        $id_prof = "";

        $answers = $this->where(['ID_prof'=>"2"]);

        $builder = $this->findAll();

        foreach ($query->result() as $teacher) {

            foreach($teacher as $key=>$row){
                
                if($answers[$key]==$row){
                    $index++;
                }
            }
            
            if($index>=$max){
                $id_prof = $query -> findColumn('ID_prof');
                $max = $index;
            }
                $index = 0;
        }

        return $query;
    }

}
