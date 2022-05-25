<?php

namespace App\Controllers;
use CodeIgniter\Controller;

class Questions extends BaseController
{
    
    public function index(){

        $session = \Config\Services::session();  

        if (isset($session->id))
        { 
            return view('quizView/quiz_home');
        }
        else 
            return view('IdView/connexion');
    }
    
    // public function quizDisplay()
    // {
    //     //$this->load->model('quizModel');
    //     $quizmodel = model(quizModel::Class);
    //     $data['questions']= $quizmodel->getAll();
    //     echo view('quizView/play_quiz', $data);
    // }

    public function questionDisplay($key = 1){

        $questionmodel = model(questionModel::Class);
        $reponsemodel = model(reponseModel::Class);

        $session = \Config\Services::session();  
        $session->set('idQ', $key); 
        
        $data['question'] = $questionmodel->getByKey($key);
        $data['reponses'] = $reponsemodel->getByQuestion($key);
        $data['idQ'] = $key;

      
        echo view('quizView/questionView', $data);
    }

    public function create()
    {
        $model = model(quizzInternauteModel::class);

        $session = \Config\Services::session();  
        $key = $session->get('idQ'); 
        
        
       // echo $this->request->getPost('questID');

        if ($this->request->getMethod() === 'post') 
        {  
            $value = [
                'QuestID' => $this->request->getPost('QuestID'),
            
            ];
            print_r ($value);
            $session = \Config\Services::session();  
            $id_inter = $session->get('id'); 
            echo $id_inter;
            $model->createQuizzInternaute($id_inter, $value);
            //echo $this->request->getPost('QuestID');


            $key++;
            if($key >12){
                return redirect()->to('/result');
            }
            else{
            return redirect()->to('/Questions/'.$key);
            }
        } 
        else 
        {
            return redirect()->to('/Questions/'.$key);
    
        }
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
