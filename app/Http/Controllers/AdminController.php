<?php
namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use DB;


class AdminController extends BaseController {


	public function addSource(){

		return view('admin.add_source');
	}


	public function saveSource(Request $request){

		$input_data = $request->all();
		unset($input_data['_token']);
		$id = DB::table('news_sources')->insertGetId($input_data);
		return redirect()->back();

	}


	public function sources(){

		$news_sources = DB::table('news_sources')
			->get();

		$page_data = [
			'sources' => $news_sources
		];

		return view('admin.sources', $page_data);

	}


	public function updateSource($id){

		$news_source = DB::table('news_sources')
			->where('id', $id)
			->first();

		$page_data = [
			'ns' => $news_source
		];

		return view('admin.update_source', $page_data);
	}


	public function doUpdateSource(Request $request){

		$id = $request->input('id');

		$default_data = [
			'is_short_url' => false,
			'is_on_break' => false,
			'is_xml' => false,
			'is_api' => false,
			'is_twitter' => false,
			'is_unsorted' => false,
			'has_query' => false,
			'is_visit_item_link' => false
		];

		$input_data = $request->all();

		$input_data = array_merge($default_data, $input_data); 

		unset($input_data['_token']);
		$id = DB::table('news_sources')
			->where('id', $id)
			->update($input_data);

		return redirect()->back();

	}

}