<?php

namespace App\Models;

use CodeIgniter\Model;


class IdModel extends Model
{
    
    protected $table = 'internaute';

    protected $allowedFields =['Identifiant', 'mdp'];

    protected $primaryKey= 'ID_ident';

    //Permet de générer une clé aléatoire lors avec insert
    protected $useAutoIncrement = true;


    /* VERIFICATION DES INFORMATIONS DE CONNEXION */

    //Vérifie que l'identifiant existe
    public function identifiantCheck($identifiant)
    {
        $query=$this->where(['Identifiant'=>$identifiant])->findAll();

        $size=count($query);

        if($size>0)
        {
          return true;
        }
        else
        {
          return false;
        }
    }

    //Vérifie que le mot de passe existe pour un identifiant donné
    public function mdpCheck($identifiant,$mdp)
    {
 
        $query=$this->where(['Identifiant'=>$identifiant,'mdp'=>$mdp])->findAll();

        $size=count($query);

        echo $size;

        if($size>0)
        {
          return true;
        }
        else
        {
          return false;
        }
       
    }


    /*INSCRIPTION*/

    public function subscribe($identifiant, $mdp)
    { 
        if ($this->identifiantCheck($identifiant)==false){ //évite des utilisateurs identiques
            $data=[
                'Identifiant' => $identifiant,
                'mdp' => $mdp
            ];
            $this->insert($data);
        } 
        
    }

    /*CHANGEMENT DE MOT DE PASSE*/

    // Affecte le nouveau mot de passe mis en argument
    public function changeMdp($identifiant, $mdp)
    {
        $data=[
            'mdp' => $mdp
        ];

        $key=$this->where(['Identifiant' => $identifiant])->findColumn('ID_ident');

        $this->update($key,$data);
    }


    /*SUPRESSION DE L'IDModel*/

    public function deleteIDModel($identifiant){
        $this->where(['Identifiant' => $identifiant])->delete();
    }


    /*GET*/

    //Renvoie toute la table
    public function getAll(){
        return $this->findAll();
    }

    //Renvoie un tableau des informations sur un internaute en fonction de sa clé
    public function getById($identifiant)
    {
        return $this->where(['Identifiant' => $identifiant])->first();
    }

}

?>