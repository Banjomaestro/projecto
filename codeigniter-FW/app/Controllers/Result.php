<?php

namespace App\Controllers;

class Result extends BaseController
{

    protected $session;

    public function index()
    {
       // $this->session->all_userdata();
        return view('result/view');
    }
}
