<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class reponse extends Model
{
    use HasFactory;
    protected $table="reponses";
    protected $fillable = ['rps','question_id','vote','vrai'];

    public function questions(){
        return $this->belongsTo(question::class);
    }
    public function userAnswer(){
        return $this->belongsToMany(userAnswer::class);
    }
}
