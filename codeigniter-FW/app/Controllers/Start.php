<?php

namespace App\Controllers;

use App\Models\quizzInternauteModel;

class Start extends BaseController
{
    public function index()
    {
        $model = model(quizzInternauteModel::class);

        if (isset($this->session->id))
        { 

            $testDone = $model->allQuestionsAnswered($this->session->id);

            if(!$testDone)
                return view('start/indexNotDone');
            else
                return view('start/indexDone');

        }else{
            return view('IdView/connexion');
        }
    }
}
