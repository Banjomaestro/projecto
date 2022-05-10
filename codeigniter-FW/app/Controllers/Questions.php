<?php

namespace App\Controllers;
use CodeIgniter\Controller;

class Questions extends BaseController
{
    
    public function index(){

        echo view('quizView/quiz_home');

    }
    
    // public function quizDisplay()
    // {
    //     //$this->load->model('quizModel');
    //     $quizmodel = model(quizModel::Class);
    //     $data['questions']= $quizmodel->getAll();
    //     echo view('quizView/play_quiz', $data);
    // }

    public function questionDisplay(){

        $questionmodel = model(questionModel::Class);
        $reponsemodel = model(reponseModel::Class);

        $session = \Config\Services::session();  
        $key = $session->get('id'); 
        
        $data['question'] = $questionmodel->getByKey($key);
        $data['reponses'] = $reponsemodel->getByKey($key);

        print_r($data);
      
        echo view('quizView/questionView', $data);
    }

    // public function view($name = null)
    // {
    //     $Repmodel = model(reponseModel::class);
    //     $Questmodel = model(questionModel::class);
    //     $data['reponse'] = $Repmodel->getAnswers($name);
    //     $data['question'] = $Questmodel->getQuestion($name);

    //     if (empty($data['reponse'])|| empty($data['question'])) {
    //         throw new \CodeIgniter\Exceptions\PageNotFoundException('Cannot find the surnames item: ' . $name);
    //     }

    //     $data['title'] = $data['question']['Libelle'];

    //     echo view('templates/header', $data);
    //     echo view('quizView/quiz_home', $data);
    //     echo view('templates/footer', $data);
    // }
}
