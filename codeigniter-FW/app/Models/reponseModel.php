<?php

namespace App\Models;

use CodeIgniter\Model;


class reponseModel extends Model
{
    
    protected $table = 'reponse';

    protected $allowedFields =['Libelle','Photo','ID_Q'];

    protected $primaryKey= 'ID_rep';

    protected $useAutoIncrement = true;


    /*ENREGISTREMENT NOUVELLE REPONSE*/

    public function newResponse($libelle, $photo, $id_q){
        $data=[
            'Libelle' => $libelle,
            'Photo' => $photo,
            'ID_Q' => $id_q
        ];
        return $this->insert_id($data);

        //retourne la clé primaire de cette nouvelle réponse
        //return $this->db->insert_id();
    }

    /*MODIFICATIONS REPONSE*/

    //libelle
    public function modifyResponseLibelle($id_rep,$libelle)
    {
        $data=[
            'Libelle' => $libelle
        ];
        $this->update($id_rep,$data);
    }

    //photo
    public function modifyResponsePhoto($id_rep,$photo)
    {
        $data=[
            'Photo' => $photo
        ];
        $this->update($id_rep,$data);
    }

    /*SUPPRESSION REPONSE*/

    public function deleteResponse($id_rep){
        $this->where(['ID_rep' => $id_rep])->delete();
    }

    /*GET*/

    public function getAll(){
        return $this->findAll();
    }

    public function getByKey($key){
        return $this->where(['ID_rep' => $key])->first();
    }
}
