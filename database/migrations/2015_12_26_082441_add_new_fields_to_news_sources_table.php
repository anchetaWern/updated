<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddNewFieldsToNewsSourcesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('news_sources', function(Blueprint $table){
            $table->string('parent_element');
            $table->string('parent_index');
            $table->string('text_source');
            $table->boolean('has_query');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('news_sources', function(Blueprint $table){
            $table->dropColumn('parent_element');
            $table->dropColumn('parent_index');
            $table->dropColumn('text_source');
            $table->dropColumn('has_query');
        });
    }
}
