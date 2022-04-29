<?php

namespace App\Models;

use CodeIgniter\Model;

class IdModel extends Model
{
    protected $table = 'internaute';

    protected $allowedFields =['Identifiant', 'mdp'];

    public function getIdentifiant($Identifiant = false)
        {
        if ($Identifiant === false) {
            return $this->findAll();
        }

        return $this->where(['Identifiant' => $Identifiant])->first();
    }
}
