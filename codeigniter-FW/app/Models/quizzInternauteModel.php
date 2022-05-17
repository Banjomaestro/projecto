<?php

namespace App\Models;
use CodeIgniter\Model;

use App\Models\IdModel;
use App\Models\reponseModel;

class quizzInternauteModel extends Model
{
  protected $table = 'quizz_Internaute';

  protected $allowedFields =['ID_ident','ID_rep'];

  protected $primaryKey= array('ID_ident','ID_rep');

  /*GET*/
  //toutes les réponses des internautes
  public function getAll() 
  {
    return $this->findAll();
  }

  //la réponse d'un internaute à une question 
  public function getAnInternauteResponseByQuestion($id_ident,$id_q)
  {
    $this->getAll();
    $this->join('question','question.ID_rep = quizz_Internaute.ID_rep');
    return $this->where(['ID_ident' => $id_ident, 'ID_Q' => $id_q])->first();
  }
  
  //toutes les réponses d'un internaute
  public function getAllInternauteResponses($id_ident)
  {
    return $this->where(['ID_ident' => $id_ident])->findAll();
  }


  /*VERIFIE SI L'INTERNAUTE A DEJA REPONDU A UNE QUESTION*/

  public function answered($id_ident,$id_q){

    $query=$this->getAnInternauteResponseByQuestion($id_ident,$id_q);

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

  /*VERIFIE SI L'INTERNAUTE A REPONDU A TOUTES LES QUESTIONS*/

  public function allQuestionsAnswered($id_ident)
  {
    $query=$this->getAllInternauteResponses($id_ident);
    $size=count($query);

    if($size==12)
    {
      return true;
    }
    else
    {
      return false;
    }
  }


  /*NOUVELLE REPONSE D'UN INTERNAUTE*/

  public function createQuizzInternaute($id_ident,$id_rep)
  { 
    if ($this->answered($id_ident,$id_rep)==false)
    {
      $data=['ID_ident'=>$id_ident,
            'ID_rep'=>$id_rep
      ];
      $this->insert($data);
    }
    else{
      echo "Question déjà répondue par l'internaute";
    }
  }
  
  /*SUPPRIMER*/
  //une reponse d'un internaute
  public function deleteInternauteResponse($id_ident,$id_rep){
      $this->where(['ID_ident' => $id_ident,'ID_rep' => $id_rep])->delete();
  }
  //toutes les réponses d'un internaute
  public function deleteAllInternauteResponses($id_ident){
    $this->where(['ID_ident' => $id_ident])->delete();
}
}