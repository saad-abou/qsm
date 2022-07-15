<?php

namespace App\Http\Controllers;

use App\Events\DiffuserEvent;
use App\Models\question;
use App\Models\score;
use App\Models\User;
use App\Models\userAnswer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\Console\Question\Question as QuestionQuestion;

class QuestionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function __construct()
    {
        $this->middleware('auth');
    }

    // get all questions 
    public function getAll(){
        $questions = question::with('responses')->get();
       return $questions;
    }

    // add user answer's and score
    public function addAnswers(Request $request){
        $score = (int)0;
        $data = $request->input('answers');
        foreach (array_filter($data) as $answer) {
            if($answer['vrai'] == 1){
                $score += 3;
            }
            else{
                $score -= 1;
            }
            $userAnser = userAnswer::create([
                'answer'=> $answer['vrai'],
                'user_id'=>Auth::user()->id,
                'reponse_id'=>$answer['id'],
                ]);
        }
        $score = user::where(['id'=> Auth::user()->id,
        ])->update(["score"=>$score]);
        return $score;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\question  $question
     * @return \Illuminate\Http\Response
     */
    public function show(question $question)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\question  $question
     * @return \Illuminate\Http\Response
     */
    public function edit(question $question)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\question  $question
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, question $question)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\question  $question
     * @return \Illuminate\Http\Response
     */
    public function destroy(question $question)
    {
        //
    }

    public function test(){

        $questions = question::with('responses')->get();
        return view('excel_question', [
            'questions' => $questions->all(),
        ]);

    }

    public function test2(){

        $Users = User::where('admin_key',0)->with('userAnswers')->get();
        foreach ($Users as $user) {
            foreach($user->userAnswers as $answer){
                if($answer->answer == 1){
                    $user['score'] = $user['score'] + 1;
                }
                $time = strtotime($answer->created_at) * 1000;
                $user['scoreTime'] = $user['scoreTime'] + $time;
            }
        }
        $sortedUsers = $Users->sort(function($a, $b) {
            if($a->score === $b->score) {
              if($a->scoreTime === $b->scoreTime) {
                return 0;
              }
              return $a->scoreTime > $b->scoreTime ? 1 : -1;
            }
            return $a->score > $b->score ? -1 : 1;
         });

       return view('excel_user', [
            'users' => $sortedUsers,
        ]);
    }
}
