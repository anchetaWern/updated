<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNewsSourcesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('news_sources', function(Blueprint $table){
            $table->increments('id');
            $table->string('title');
            $table->string('route');
            $table->string('category');
            $table->string('curator');
            $table->string('base_url'); // $html->load_file('http://html5weekly.com/latest');
            $table->string('day_to_update');
            $table->string('latest_url_element'); // $latest_url = $html->find($latest_url_element, 2)->href;
            $table->integer('latest_url_index'); //  $latest_url = $html->find('a', $latest_url_index)->href;
            $table->string('latest_url_base'); // $html->load_file('http://www.phpweekly.com' . $latest_link);
            $table->string('item_element'); // foreach($html->find('.newsletter_section a') as $link){
            $table->boolean('is_short_url'); // for individual links that needs redirects (Url::getRedirect($link->href);)
            $table->boolean('is_on_break');
            $table->boolean('is_xml');
            $table->string('h2');
            $table->string('h3');
            $table->string('search_str');
            $table->string('replace_str');
            $table->boolean('is_api');
            $table->boolean('is_twitter');
            $table->boolean('is_unsorted');
            $table->text('excluded_text');
            $table->text('excluded_url');



        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('news_sources');
    }
}
