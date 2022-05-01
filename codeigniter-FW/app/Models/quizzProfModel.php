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
        $id_prof = 0;

        $answers = $this->where(['ID_prof'=>"16"])->findAll();
        

        $query = $this->orderBy('ID_prof','ASC')->findAll();
        
        for ($y = 0; $y < 16; $y++) {

            for ($i = 0; $i < 12; $i++) {
                if($answers[$i]['ID_rep']==$query[$i+($y*12)]['ID_rep']){
            
                    $index++;
                }
            }
            
            if($index>=$max){
                $id_prof = $query[$i+($y*12)-1]['ID_prof'];
                $max = $index;
            }
                $index = 0;
        }
        
        return $query;
    }

}
