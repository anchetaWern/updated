@extends('layouts.admin')

@section('title')
<title>Add News Source</title>
@stop


@section('content')
<h2>Add News Source</h2>
<form method="POST">
	<input type="hidden" name="_token" value="{{ csrf_token() }}">
	<p>
		<label for="title">Title</label>
		<input type="text" name="title" id="title">
	</p>
	<p>
		<label for="route">Route</label>
		<input type="text" name="route" id="route">
	</p>
	<p>
		<label for="category">Category</label>
		<input type="text" name="category" id="category">
	</p>
	<p>
		<label for="curator">Curator</label>
		<input type="text" name="curator" id="curator">
	</p>		
	<p>
		<label for="base_url">Base URL</label>
		<input type="text" name="base_url" id="base_url">
	</p>
	<p>
		<label for="day_to_update">Day to Update</label>
		<input type="text" name="day_to_update" id="day_to_update">
	</p>
	<p>
		<label for="latest_url_element">Latest URL Element</label>
		<input type="text" name="latest_url_element" id="latest_url_element">
	</p>	
	<p>
		<label for="latest_url_index">Latest URL Index</label>
		<input type="text" name="latest_url_index" id="latest_url_index">
	</p>
	<p>
		<label for="latest_url_base">Latest URL Base</label>
		<input type="text" name="latest_url_base" id="latest_url_base">
	</p>
	<p>
		<label for="item_element">Item Element</label>
		<input type="text" name="item_element" id="item_element">
	</p>

	<p>
		<label>
		    <input type="checkbox" name="is_short_url" value="1">
		    <span class="checkable">Short URL</span>
		</label>
	</p>

	<p>
		<label>
		    <input type="checkbox" name="is_on_break" value="1">
		    <span class="checkable">On Break</span>
		</label>
	</p>

	<p>
		<label>
		    <input type="checkbox" name="is_xml" value="1">
		    <span class="checkable">XML</span>
		</label>
	</p>

	<p>
		<label for="h2">h2</label>
		<input type="text" name="h2" id="h2">
	</p>
	<p>
		<label for="h3">h3</label>
		<input type="text" name="h3" id="h3">
	</p>
	<p>
		<label for="search_str">Search String</label>
		<input type="text" name="search_str" id="search_str">
	</p>	
	<p>
		<label for="replace_str">Replace String</label>
		<input type="text" name="replace_str" id="replace_str">
	</p>

	<p>
		<label>
		    <input type="checkbox" name="is_api" value="1">
		    <span class="checkable">API</span>
		</label>
	</p>

	<p>
		<label>
		    <input type="checkbox" name="is_twitter" value="1">
		    <span class="checkable">Twitter</span>
		</label>
	</p>

	<p>
		<label>
		    <input type="checkbox" name="is_unsorted" value="1">
		    <span class="checkable">Unsorted</span>
		</label>
	</p>
	
	<p>
		<label for="excluded_text">Excluded Text</label>
		<textarea name="excluded_text" id="excluded_text" rows="10"></textarea>
	</p>
	<p>
		<label for="excluded_url">Excluded URL</label>
		<textarea name="excluded_url" id="excluded_url" rows="10"></textarea>
	</p>

	<p>
		<label for="twitter_screen_name">Twitter Screen Name</label>
		<input type="text" name="twitter_screen_name" id="twitter_screen_name">
	</p>
	
	<p>
		<label for="parent_element">Parent Element</label>
		<input type="text" name="parent_element" id="parent_element">
	</p>

	<p>
		<label for="parent_index">Parent Index</label>
		<input type="text" name="parent_index" id="parent_index">
	</p>

	<p>
		<label for="text_source">Text Source</label>
		<input type="text" name="text_source" id="text_source">
	</p>

	<p>
		<label>
		    <input type="checkbox" name="has_query" value="1">
		    <span class="checkable">Has Query</span>
		</label>
	</p>

	<p>
		<label>
		    <input type="checkbox" name="is_visit_item_link" value="1">
		    <span class="checkable">Visit Item Link</span>
		</label>
	</p>

	<p>
		<label for="api_field">API Field</label>
		<input type="text" name="api_field" id="api_field">
	</p>

	<p>
		<label for="item_base_url">Item Base URL</label>
		<input type="text" name="item_base_url" id="item_base_url">
	</p>

	<button>Save</button>
</form>
@stop