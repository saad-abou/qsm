<?php

namespace App\Exports;

use App\Models\question;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;

class QuestionsExport implements FromView
{
    public function view(): View
    {
        $questions = question::with('responses')->get();
        return view('excel_question', [
            'questions' => $questions->all(),
        ]);
    }
}
