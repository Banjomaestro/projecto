<?php

namespace App\Models;
use CodeIgniter\Model;

class quizzInternauteModel extends Model
{
  protected $table = 'quizz_Internaute';

  protected $allowedFields = ['ID_ident','ID_rep'];

  protected $primaryKey = array('ID_ident','ID_rep');

  /*Fonction private*/
  //Récupère l'id_ident avec l'identifiant
  private function getId_ident($identifiant)
  {
    $modelID=model(IdModel::class);

    $id_ident=$modelID->where(['Identifiant'=>$identifiant])->findColumn('ID_ident');

    return $id_ident;
  }
  /**/

  /*GET*/
  //tous les quizz des internautes
  public function getAll()
  {
    return $this->findAll();
  }

  //le quizz d'un internaute à une question donnée
  public function getAnInternauteQuizzByQuestion($identifiant,$id_q)
  {
    $id_ident=$this->getId_ident($identifiant);

    $rep=$this->join('reponse','reponse.ID_rep = quizz_Internaute.ID_rep')
    ->where(['quizz_Internaute.ID_ident' => $id_ident,'reponse.ID_Q' => $id_q])
    ->first();

    if($rep)
    {
      $id_rep=$rep['ID_rep'];
    }

    else
    {
      $id_rep=0;
    }


    return $this->where(['ID_ident'=>$id_ident, 'ID_rep'=>$id_rep])->first();
  }
  
  //tous les quizz d'un internaute
  public function getAllInternauteQuizz($identifiant)
  {
    $id_ident=$this->getId_ident($identifiant);
    return $this->where(['ID_ident' => $id_ident])->findAll();
  }

  /*VERIFIE SI L'INTERNAUTE A REPONDU A TOUTES LES QUESTIONS*/

  public function allQuestionsAnswered($identifiant)
  {
    $query=$this->getAllInternauteQuizz($identifiant);
    
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

    
  /*SUPPRIMER*/
  //une réponse d'un internaute
  public function deleteInternauteResponse($identifiant,$id_rep)
  {
    $id_ident=$this->getId_ident($identifiant);
    $this->where(['ID_ident' => $id_ident,'ID_rep' => $id_rep])->delete();
  }
  //toutes les réponses d'un internaute
  public function deleteAllInternauteResponses($identifiant)
  {
    $id_ident=$this->getId_ident($identifiant);
    $this->where(['ID_ident' => $id_ident])->delete();
  }


  /*NOUVELLE REPONSE D'UN INTERNAUTE*/

  public function createQuizzInternaute($identifiant,$id_rep)
  { 
    $repModel=model(reponseModel::class);
    $id_q=$repModel->where(['reponse.ID_rep'=>$id_rep])->first()['ID_Q'];

    $previousResponse=$this->getAnInternauteQuizzByQuestion($identifiant,$id_q);

    if ($previousResponse)
    {
      $idPreviousResponse=$previousResponse['ID_rep'];
      //écrase la réponse précédente
      $this->deleteInternauteResponse($identifiant,$idPreviousResponse);
    }

    $id_ident=$this->getId_ident($identifiant);

    $data=[
    'ID_ident'=>$id_ident,
    'ID_rep'=>$id_rep
    ];

    $this->insert($data);
  }

}