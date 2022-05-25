<?php

namespace App\Controllers;

use App\Models\quizzInternauteModel;

class Start extends BaseController
{
    public function index()
    {
        $model = model(quizzInternauteModel::class);
        $session = \Config\Services::session();  
        $id =$session->get('id'); 


        if ((true))
        { 
            $testDone = $model->allQuestionsAnswered($id);

            if(!$testDone)
                return view('start/indexNotDone');

            else
                return view('start/indexDone');

        }else{
            return view('IdView/connexion');
        }
    }
}
