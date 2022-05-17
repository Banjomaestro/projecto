<?php

namespace App\Controllers;

class Pages extends BaseController
{
    public function index()
    {
        if (isset($this->session->id))
        { 
            echo view('quizView/quiz_home');
        }
        else 
            return view('IdView/connexion');
    }

    public function view($page = 'home')
    {
        if (! is_file(APPPATH . 'Views/pages/' . $page . '.php')) {
            // Whoops, we don't have a page for that!
            throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
        }
    
        $data['title'] = ucfirst($page); // Capitalize the first letter
    
        echo view('templates/header', $data);
        echo view('pages/' . $page, $data);
        echo view('templates/footer', $data);
    }
}