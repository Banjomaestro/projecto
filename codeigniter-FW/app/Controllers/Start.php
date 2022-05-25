<?php

namespace App\Controllers;

use App\Models\quizzProfModel;
use App\Models\quizzInternauteModel;

class Start extends BaseController
{
    public function index()
    {
        $model = model(quizzProfModel::class);
        $model2 = model(quizzInternauteModel::class);
        $model3 = model(teacherModel::class);
        $session = \Config\Services::session();  
        $id =$session->get('id'); 

        

        if ((true))
        { 
            $testDone = $model2->allQuestionsAnswered($id);

            if(!$testDone)
                return view('start/indexNotDone');

            else{
                $answers = $model2->getAllInternauteQuizz($session->id);
                $teacher = $model->getTeacher($answers);
                $name = $model3->getById($teacher);
                return view('start/indexDone', $name);

            }


        }else{
            return view('IdView/connexion');
        }
    }
}
