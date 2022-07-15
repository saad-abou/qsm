<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class userAnswer extends Model
{
    use HasFactory;
    protected $fillable = ['answer','reponse_id','user_id'];
    public function reponse(){
        return $this->belongsTo(reponse::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
