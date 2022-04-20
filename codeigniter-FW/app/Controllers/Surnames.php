<?php

namespace App\Controllers;

use App\Models\TestModel;

class Surnames extends BaseController
{
    public function index()
    {
        $model = model(TestModel::class);

        $data = [
            'surnames'  => $model->getSurnames(),
            'title' => 'Surnames list',
        ];

        echo view('templates/header', $data);
        echo view('surnames/overview', $data);
        echo view('templates/footer', $data);
    }

    public function view($name = null)
    {
        $model = model(TestModel::class);

        $data['surnames'] = $model->getSurnames($name);

        if (empty($data['surnames'])) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Cannot find the surnames item: ' . $name);
        }

        $data['title'] = $data['surnames']['name'];

        echo view('templates/header', $data);
        echo view('surnames/view', $data);
        echo view('templates/footer', $data);
    }
}

    