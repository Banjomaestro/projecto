<?php

namespace App\Controllers;

use App\Models\quizzProfModel;
use App\Models\quizzInternauteModel;

class Result extends BaseController
{

    public function index()
    {
        
        $model = model(quizzProfModel::class);
        $model2 = model(quizzInternauteModel::class);
        $model3 = model(teacherModel::class);
        $session = \Config\Services::session();  


        if (isset($session->id))
       { 
        
            $answers = $model2->getAllInternauteQuizz($session->id);
            $teacher = $model->getTeacher($answers);
            $name = $model3->getById($teacher);
            return view('result/view', $name);
            
       }
       else 
            return view('IdView/connexion');
            

    }

    
}
