<?php

use App\Http\Controllers\excelController;
use App\Http\Controllers\publicResources;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\ReponseController;
use App\Http\Controllers\UserAnswerController;
use App\Http\Controllers\UserController;
use App\Models\userAnswer;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes();

//getWelcome
Route::get('/', function(){return view('publicPage');})->name('/');
//getSondage
Route::get('/qsm', [App\Http\Controllers\HomeController::class, 'index'])->name('/');
//getQuestion
Route::get('/Questions', [App\Http\Controllers\HomeController::class, 'question']);

//getAllQuestions
Route::get('getquestions',[QuestionController::class,'getAll']);
//add users answer's
Route::post('addAnswers',[QuestionController::class,'addAnswers']);
//getUser
Route::get('getuser',[UserController::class,'getUser']);




