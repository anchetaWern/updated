<?php
namespace App\Console\Commands;

use Illuminate\Console\Command;

use DB;

use Carbon\Carbon;
use Git;
use Url;
use simple_html_dom;
use TwitterAPIExchange;

class UpdateSite extends Command
{

    protected $name = 'update:site';

    private function pushFiles(){
    	try{
			$repo = Git::open(base_path() . '/public/site'); 

			$repo->add('.');
			$repo->commit(time());
			$repo->push("https://updatedapp:" . config('github.password') . "@github.com/updatedapp/updatedapp.github.io.git", 'master');

    	}catch(Exception $e){
    		
    	}
    }

    
    public function fire(){

    	$this->pushFiles();

    }
    

   
    

}