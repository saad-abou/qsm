<?php

namespace App\Providers;

use App\Providers\diffuserEvant;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class diffuserEvantListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  diffuserEvant  $event
     * @return void
     */
    public function handle(diffuserEvant $event)
    {
        //
    }
}
