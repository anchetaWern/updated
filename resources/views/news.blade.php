@extends('layouts.default')

@section('content')

<div id="news_sources_container">
	<h3>{{ env('APP_TITLE') }}</h3>
	<a href="/settings" id="mobile-settings-button" class="button small-button">Settings</a>
	<select name="news_sources" id="news_sources" class="hidden">
		@foreach($news_sources as $url => $news_source)
		<option value="/{{ $url }}" {{ FormHelper::isSelected($url, $category) }}>{{ $news_source['title'] }}</option>
		@endforeach
	</select>
</div>

<div id="sidebar">
	<h3>{{ env('APP_TITLE') }}</h3>
	<ul id="types">
		@foreach($news_sources as $url => $news_source)
		<li>
			<a href="/{{ $url }}">{{ $news_source['title'] }}</a>
		</li>
		@endforeach
	</ul>
</div>

<div id="items-container">
	<h1>{{ $category }}</h1>
	<a href="/settings" id="settings-button" class="button small-button">Settings</a>
	<ul id="items" class="hidden">
		
	</ul>
</div>


@include('partials.categories')
@include('partials.categories-mobile')
@include('partials.news_items')
@stop

@section('news_script')
<script src="{{ url('assets/js/news.js') }}"></script>
@stop