<?php
namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;


class NewsController extends BaseController {


	public function index($category = 'hn'){

		$sources = file_get_contents(url('/files/sources.json'));
		$news_sources = json_decode($sources, true);

		$page_data = [
			'category' => $category,
			'news_sources' => $news_sources
		];

		return view('news', $page_data);

	}


	public function settings(){

		$sources = file_get_contents(url('/files/sources.json'));
		$news_sources = json_decode($sources, true);

		$page_data = [
			'category' => 'settings',
			'news_sources' => $news_sources
		];

		return view('settings', $page_data);

	}


}


