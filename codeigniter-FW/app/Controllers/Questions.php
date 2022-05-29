<?php

namespace App\Controllers;
use CodeIgniter\Controller;

class Questions extends BaseController
{
    
    public function index(){
        
        //access to the session
        $session = \Config\Services::session();  
        //check if the user is connected before starting the quiz
        if (isset($session->id))
        { 
            return view('quizView/quiz_home');
        }
        else 
            return view('IdView/connexion');
    }
    


    public function questionDisplay($key = 1){


        //access to the models
        $questionmodel = model(questionModel::Class);
        $reponsemodel = model(reponseModel::Class);

        //access to the session
        $session = \Config\Services::session();  
        $session->set('idQ', $key);  //get the id of the question 
        
        $data['question'] = $questionmodel->getByKey($key); //put the question datas in an array
        $data['reponses'] = $reponsemodel->getByQuestion($key); //put the respeonse datas in an array
        $data['idQ'] = $key; //set the id of the question to the parameter key

      
        echo view('quizView/questionView', $data); //display the question page
        echo view('templates/footer'); //footer
    }

    //send the responses to the model
    public function create()
    {
        //acces to the the model
        $model = model(quizzInternauteModel::class);
        
        //access to the session
        $session = \Config\Services::session();  
        $key = $session->get('idQ'); //takes the id of the question to fill correctly the database
        
        
       // echo $this->request->getPost('questID');

        if ($this->request->getMethod() === 'post') 
        {  
            $value = [
                'QuestID' => $this->request->getPost('QuestID'), //takes the response by a POST methodd of a form
            
            ];
            //print_r ($value);
            $session = \Config\Services::session();  
            $id_inter = $session->get('id'); //takes the username id 
            //echo $id_inter;
            $model->createQuizzInternaute($id_inter, $value); //send the informations to the model
            //echo $this->request->getPost('QuestID');

            //go to the next question
            $key++;
            if($key >12){ //end of the quizz : redirect to result
                return redirect()->to('/result');
            }
            else{ // redirect to questionDisplay()
            return redirect()->to('/Questions/'.$key);
            }
        } 
        else 
        {
            return redirect()->to('/Questions/'.$key);
    
        }
    }


}
