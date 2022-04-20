<?php

namespace App\Models;

use CodeIgniter\Model;

class TestModel extends Model
{
    protected $table = 'surname';

    public function getSurnames($name = false)
        {
        if ($name === false) {
            return $this->findAll();
        }

        return $this->where(['name' => $name])->first();
    }
}
