<?php

namespace App\Controllers;

use App\Models\IdModel;

class IdController extends BaseController
{
    public function index()
    {
        $model = model(IdModel::class);

        $data = [
            'internaute'=> $model->getAll(),
            'title' => 'Liste Identifiants',
        ];

        echo view('templates/header', $data);
        echo view('IdView/overview', $data);
        echo view('templates/footer', $data);
        
    }

    

    public function view($Identifiant = null)
    {
        $model = model(IdModel::class);

        $data['internaute'] = $model->getByKey($Identifiant);

        if (empty($data['internaute'])) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Cannot find the login item: ' . $Identifiant);
        }

        $data['title'] = $data['internaute']['Identifiant'];

        echo view('templates/header', $data);
        echo view('IdView/view', $data);
        echo view('templates/footer', $data);
    }

    public function create()
    {
        $model = model(IdModel::class);

        if ($this->request->getMethod() === 'post' && $this->validate([
            'Identifiant' => 'required|min_length[3]|max_length[255]',
            'mdp'  => 'required',]) && $model->identifiantCheck($this->request->getPost('Identifiant'))==false) 
        {  
            $model->save([
                'Identifiant' => $this->request->getPost('Identifiant'),
                'mdp'  => md5($this->request->getPost('mdp')),
            ]);
            echo view('IdView/success');
        } 
        else if ($model->identifiantCheck($this->request->getPost('Identifiant'))==true){
            echo view('templates/header', ['title' => 'Mauvais Identifiant']);
            echo view('IdView/errorSubscribe');
            echo view('templates/footer');
        }
        else 
        {
            echo view('templates/header', ['title' => 'Créer un nouveau compte']);
            echo view('IdView/inscription');
            echo view('templates/footer');
        }
    }

    public function connexion()
    {
        $model = model(IdModel::class);

        if ($this->request->getMethod() === 'post' && $model->identifiantCheck($this->request->getPost('Identifiant'))==true) 
        {  
            if ($this->request->getMethod() === 'post' && $model->mdpCheck($this->request->getPost('Identifiant'),$this->request->getPost('mdp'))==true)
            {
                echo view('templates/header', ['title' => 'Accueil']);
                echo view('IdView/successConnexion');
                echo view('templates/footer');
            }
            echo view('templates/header', ['title' => 'Mauvais mot de passe']);
            echo view('IdView/errorMdp');
            echo view('templates/footer');
        } 
        else if ($model->identifiantCheck($this->request->getPost('Identifiant'))==false){
            echo view('templates/header', ['title' => 'Identifiant non existant']);
            echo view('IdView/errorId');
            echo view('templates/footer');
        }
      
    
        else 
        {
            echo view('templates/header', ['title' => 'Accueil']);
            echo view('IdView/connexion');
            echo view('templates/footer');
        }
    }
}

    