<?php

namespace App\Exports;

use App\Models\User;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;

class UserExport implements FromView
{
    public function view(): View
    {
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
