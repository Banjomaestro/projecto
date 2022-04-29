<?php

namespace App\Controllers;

use App\Models\IdModel;

class IdController extends BaseController
{
    public function index()
    {
        $model = model(IdModel::class);

        $data = [
            'internaute'=> $model->getIdentifiant(),
            'title' => 'Liste Identifiants',
        ];

        echo view('templates/header', $data);
        echo view('IdView/overview', $data);
        echo view('templates/footer', $data);
        
    }

    

    public function view($Identifiant = null)
    {
        $model = model(IdModel::class);

        $data['internaute'] = $model->getIdentifiant($Identifiant);

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
            'mdp'  => 'required',])) 
        {  
            $model->save([
                'Identifiant' => $this->request->getPost('Identifiant'),
                'mdp'  => md5($this->request->getPost('mdp')),
            ]);
            echo view('IdView/success');
        } 
        else 
        {
            echo view('templates/header', ['title' => 'Create a new identifiant']);
            echo view('IdView/inscription');
            echo view('templates/footer');
        }
    }
}

    