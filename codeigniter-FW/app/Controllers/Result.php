<?php

namespace App\Controllers;

use App\Models\quizzProfModel;

class Result extends BaseController
{

    public function index()
    {

        $model = model(quizzProfModel::class);

        if (isset($this->session->id))
        { 
        
       // $this->session->all_userdata();
            return view('result/view');
        }
        else 
            return view('IdView/connexion');

    }
}
