<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Laravel\Lumen\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        'App\Console\Commands\UpdateNewsItems',
        'App\Console\Commands\GenerateFiles',
        'App\Console\Commands\UpdateSite',
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('update:news_items')->dailyAt('8:30');   
        $schedule->command('generate:files')->dailyAt('9:30');
        $schedule->command('update:site')->dailyAt('9:31');
    }
}
