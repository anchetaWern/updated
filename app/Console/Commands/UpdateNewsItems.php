<?php
namespace App\Console\Commands;

use Illuminate\Console\Command;

use DB;

use Carbon\Carbon;
use Git;
use Url;
use simple_html_dom;
use TwitterAPIExchange;

class UpdateNewsItems extends Command
{

    protected $name = 'update:news_items';

    private function updateDatabase(){

    	try{

			$client = new \GuzzleHttp\Client();

			$day_of_week = Carbon::now()->format('l');

			$news_sources = DB::table('news_sources')
				->where('day_to_update', $day_of_week)
				->orWhere('day_to_update', '')
				->get();
				

			foreach($news_sources as $ns){

				echo "updating {$ns->title}\n";

				if($ns->is_api == 1){

					if($ns->route == 'hn'){

					    $top_stories = array();

					    $topstories_res = $client->get('https://hacker-news.firebaseio.com/v0/topstories.json');
					    
					    $topstories_ids = json_decode($topstories_res->getBody(), true);

					    foreach($topstories_ids as $id){

					    	try{

						        $item_res = $client->get("https://hacker-news.firebaseio.com/v0/item/" . $id . ".json");
						        $item_data = json_decode($item_res->getBody(), true);

						        $text = html_entity_decode($item_data['title'], ENT_QUOTES);

						        if(!empty($item_data['url']) && filter_var($item_data['url'], FILTER_VALIDATE_URL)){
						        	$url = $item_data['url'];
									$url_parts = new \Purl\Url($url);
									if(!empty($url_parts->registerableDomain)){

								        $time = date('Y-m-d H:i:s', $item_data['time']);
								    
								        $db_item = DB::table('news')
								            ->where('url', '=', $url)
								            ->first();

								       
								        if(empty($db_item)){

								            DB::table('news')->insert([
								                'title' => $text,
								                'url' => $url,
								                'category' => 'hn',
								                'timestamp' => $time,
								                'curator' => 'hackernews',
								                'source' => $url_parts->registerableDomain,
								                'status' => 1
								            ]);
								        }else{
								            DB::table('news')->where('id', $db_item->id)
								            	->update(['timestamp' => $time]);
								        }

								        echo $text . " - " . $url . "\n";
								        
									}
						        }
					    	}catch(Exception $e){
					    		echo "something went wrong\n";
					    	}


					    }

					}


				}else if($ns->is_xml == 1){

					try{

						$html = file_get_contents($ns->base_url);
					    $xml = simplexml_load_string($html, 'SimpleXMLElement', LIBXML_NOCDATA | LIBXML_NOBLANKS);
					    $data = json_decode(json_encode($xml), true);

					    foreach($data['channel']['item'] as $item){
					        
					        $text = $item['title'];
					        $url = trim($item['link']);

					        if(filter_var($url, FILTER_VALIDATE_URL)){

								$url_parts = new \Purl\Url($url);
								
						     	
						        if(!empty($text) && !empty($url) && !empty($url_parts->host) && !empty($url_parts->registerableDomain)){

						        	if($ns->has_query == 1){
							           	$url = $url_parts->query['url'];
							           	$url = urldecode($url);
							           	
							           	$url_parts = new \Purl\Url($url);
						        	}

						            $time = date('Y-m-d H:i:s');
						            
						            $db_item = DB::table('news')->where('url', '=', $url)->first();

						           
						            if(empty($db_item)){
						                DB::table('news')->insert([
						                    'title' => html_entity_decode($text, ENT_QUOTES),
						                    'url' => $url,
						                    'category' => $ns->category,
						                    'timestamp' => $time,
						                    'curator' => $ns->curator,
						                    'source' => $url_parts->registerableDomain,
						                    'status' => 1
						                ]);
						            }else{
						                DB::table('news')->where('id', $db_item->id)
						                	->update(['timestamp' => $time]);
						            } 
						            
						            
						            echo $text . " - " . $url . "\n";
						           
						        }
					        }

					    }

					}catch(Exception $e){
						echo "something went wrong\n";
					}


				}else if($ns->is_twitter == 1){

					try{
						$request_url = 'https://api.twitter.com/1.1/statuses/user_timeline.json';
						$get_field = '?screen_name=' . $ns->twitter_screen_name . '&exclude_replies=true&include_rts=false';
						$request_method = 'GET';

						$twitter = new TwitterAPIExchange(config('twitter'));
						$json = $twitter->setGetfield($get_field)
						    ->buildOauth($request_url, $request_method)
						    ->performRequest();

						$data = json_decode($json, true);
						
						foreach($data as $row){

							$org_text = $row['text'];
							$url = (!empty($row['entities']['urls'])) ? $row['entities']['urls'][0]['expanded_url'] : '';
							$twitter_url = (!empty($row['entities']['urls'])) ? $row['entities']['urls'][0]['url'] : '';

							if(!empty($url) && filter_var($url, FILTER_VALIDATE_URL)){
								
						        $time = date('Y-m-d H:i:s');
						      
								$url_parts = new \Purl\Url($url);

						        $text = str_replace($twitter_url, '', $org_text);
						        
						        $db_item = DB::table('news')->where('url', '=', $url)->first();

						        if(empty($db_item)){
						            DB::table('news')->insert([
										'title' => html_entity_decode($text, ENT_QUOTES),
										'url' => $url,
										'category' => $ns->category,
										'timestamp' => $time,
										'curator' => $ns->curator,
										'source' => $url_parts->registerableDomain,
										'status' => 1
						            ]);
						        }else{
						            DB::table('news')->where('id', $db_item->id)
						            	->update(['timestamp' => $time]);
						        }
						       
						        echo $text . ' - ' . $url . "\n";
							}

						}

					}catch(Exception $e){
						echo "something went wrong\n";
					}

				}else{
				
					$html = new simple_html_dom();

					if(!empty($ns->api_field)){
						try{
							$response = $client->get($ns->base_url);
							$item_data = json_decode($response->getBody(), true);
							$latest_url = $item_data[0][$ns->api_field];
							$html->load_file($latest_url);
						}catch(Exception $e){
							echo "something went wrong\n";
						}
					}else{
						$html->load_file($ns->base_url);
					}


					if(!empty($ns->latest_url_element)){
						try{
							$latest_url = $html->find($ns->latest_url_element, $ns->latest_url_index)->href;
							$html->load_file($ns->latest_url_base . $latest_url);
						}catch(Exception $e){
							echo "something went wrong\n";
						}
					}


					if(!empty($ns->parent_element)){
						$html = $html->find($ns->parent_element, $ns->parent_index); 
					}

					if($ns->is_unsorted == 1){

						$links = array();

					    foreach($html->find('a') as $link){

							$text = trim($link->plaintext);
							$url = $link->href;

							if(stristr($text, '../') === false){
					    		$links[] = str_replace('.html', '', $text);
							}
					    }

					    asort($links);

					    $latest_url = $ns->base_url . array_slice($links, -1)[0] . '.html';
					    $html->load_file($latest_url);
					}


					foreach($html->find($ns->item_element) as $link){

						$text = html_entity_decode(trim($link->plaintext), ENT_QUOTES);
						$url = $link->href;

						if(filter_var($url, FILTER_VALIDATE_URL)){

							if($ns->h2 && $ns->h3){

								$h2 = $link->find($ns->h2, 0);
								$h3 = $link->find($ns->h3, 0);
								if($h2){
									$text = trim($h2->plaintext);
								}else if($h3){
									$text = trim($h3->plaintext);
								}
							}
							

							$url_parts = new \Purl\Url($url);


							if($ns->is_short_url == 1){
								try{
									$url = Url::getRedirect($link->href);
								}catch(Exception $e){
									echo "something went wrong\n";
								}
							}

							if(!empty($ns->item_base_url)){
								$url = $ns->item_base_url . $url;
							}
					
							$url = str_replace($ns->search_str, $ns->replace_str, $url);
							$url_parts = new \Purl\Url($url);

							if(!empty($text) && !empty($url) && !empty($url_parts->registerableDomain) && strpos($ns->excluded_text, $text) === false && strpos($ns->excluded_url, $url) === false && !empty($url_parts->registerableDomain) && strpos($ns->excluded_url, $url_parts->registerableDomain) === false){

								if($ns->is_visit_item_link == 1){
									try{
										$html = file_get_html($url);
										if($html){

											$text = $html->find('title', 0);
											
											if(!empty($text)){
												$text = $text->plaintext;
												$text = html_entity_decode($text, ENT_QUOTES);
											}
										}
									}catch(Exception $e){
										echo "something went wrong\n";
									}
									
								}
								

								$db_item = DB::table('news')->where('url', '=', $url)->first();

								$time = Carbon::now()->format('Y-m-d H:i:s');

								
								if(empty($db_item)){
								    DB::table('news')->insert([
										'title' => html_entity_decode($text, ENT_QUOTES),
										'url' => $url,
										'category' => $ns->category,
										'timestamp' => $time,
										'curator' => $ns->curator,
										'source' => $url_parts->registerableDomain,
										'status' => 1
								    ]);
								}else{
								    DB::table('news')->where('id', $db_item->id)
								    	->update(
								    		[
												'timestamp' => $time
								    		]
								    	);
								}
								

								echo $text . ' - ' . $url . "\n";

							}
						}


					}
				}	


			}
    	}catch(Exception $e){

    	}

    }

    
    public function fire(){

    	$this->updateDatabase();		

    }
    

   
    

}