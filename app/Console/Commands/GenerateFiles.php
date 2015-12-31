<?php
namespace App\Console\Commands;

use Illuminate\Console\Command;

use DB;

use Carbon\Carbon;
use Git;
use Url;
use simple_html_dom;
use TwitterAPIExchange;

class GenerateFiles extends Command
{

    protected $name = 'generate:files';


    private function generateFiles(){

    	try{

			$server_timezone = env('APP_TIMEZONE');

			$categories = DB::table('news_sources')
				->groupBy('category')
				->lists('category');

			$app_url = env('APP_URL');

			foreach($categories as $category){

				$news = DB::table('news')
						->where('category', $category)
						->where('status', 1)
						->orderBy('timestamp', 'DESC')
						->first();	

				$news_count = count($news);

				$last_updated = Carbon::now()->toDateString();
				if($news_count > 0){
					$last_updated = Carbon::createFromFormat(
						'Y-m-d H:i:s', $news->timestamp, $server_timezone
					)->toDateString();
				}

				$news = DB::table('news')
						->where('category', $category)
						->where('status', 1)
						->whereRaw(DB::raw("DATE(timestamp) = '$last_updated'"))
						->select('title', 'url', 'source')
						->orderBy('timestamp', 'DESC')
						->get();

				try{
					$contents = file_get_contents($app_url . '/' . $category);
					$contents = str_replace($app_url, '', $contents);


					file_put_contents(base_path() . "/public/site/{$category}.html", $contents);
					file_put_contents(base_path() . "/public/files/{$category}.json", json_encode($news));
					file_put_contents(base_path() . "/public/site/files/{$category}.json", json_encode($news));
				}catch(Exception $e){
					
				}
				
			}


			$other_files = [
				[
					'url' => '/hn',
					'path' => 'index.html'
				],
				[
					'url' => '/settings',
					'path' => 'settings.html'
				],
			];

			foreach($other_files as $file){
				try{
					$contents = file_get_contents($app_url . $file['url']);
					$contents = str_replace($app_url, '', $contents);

					file_put_contents(base_path() . "/public/site/{$file['path']}", $contents);
				}catch(Exception $e){
					
				}

			}


			$curators = DB::table('news_sources')
				->groupBy('curator')
				->lists('curator');

			foreach($curators as $curator){

				$news = DB::table('news')
						->where('curator', $curator)
						->where('status', 1)
						->orderBy('timestamp', 'DESC')
						->first();	

				$news_count = count($news);

				$last_updated = Carbon::now()->toDateString();
				if($news_count > 0){
					$last_updated = Carbon::createFromFormat('Y-m-d H:i:s', $news->timestamp, $server_timezone)
						->toDateString();
				}

				$news = DB::table('news')
						->where('curator', $curator)
						->where('status', 1)
						->whereRaw(DB::raw("DATE(timestamp) = '$last_updated'"))
						->select('title', 'url', 'source')
						->orderBy('timestamp', 'DESC')
						->get();

				try{
					file_put_contents(base_path() . "/public/files/{$curator}.json", json_encode($news));

					file_put_contents(base_path() . "/public/site/files/{$curator}.json", json_encode($news));
				}catch(Exception $e){
					
				}
			
			}
    	}catch(Exception $e){
    		
    	}

    }


    
    public function fire(){

    	$this->generateFiles();
    	
    }
    

   
    

}