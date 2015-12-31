<?php

use Illuminate\Database\Seeder;

class seed_news_sources_and_excludes_table extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('news_sources')->truncate();
        
    }
}
