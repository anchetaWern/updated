<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Wern Ancheta">
	<meta name="keywords" content="news,web-development,programming,design">
	<meta name="description" content="Your developer news. All in one place.">

       
	<meta property="og:title" content="{{ env('APP_TITLE') }}">
	<meta property="og:type" content="website">
	<meta property="og:image" content="{{ url('assets/img/icon.png') }}">
	<meta property="og:url" content="http://updatedapp.github.io">
	<meta property="og:description" content="Your developer news. All in one place.">

	    
	<meta name="twitter:card" content="Your developer news. All in one place.">
	<meta name="twitter:title" content="{{ env('APP_TITLE') }}">
	<meta name="twitter:description" content="Your developer news. All in one place.">
	<meta name="twitter:image" content="{{ url('assets/img/android-icon-72x72.png') }}">

	<title>{{ env('APP_TITLE') }}</title>
	<link rel="stylesheet" href="{{ url('assets/picnic/releases/picnic.min.css') }}">
	<link rel="stylesheet" href="{{ url('assets/css/news.css') }}">
	
	<link rel="icon" type="image/png" sizes="32x32" href="{{ url('assets/img/favicon-32x32.png') }}">
	<link rel="icon" type="image/png" sizes="96x96" href="{{ url('assets/img/favicon-96x96.png') }}">
	<link rel="icon" type="image/png" sizes="16x16" href="{{ url('assets/img/favicon-16x16.png') }}">


</head>
<body>
	@yield('content')

	<script src="{{ url('assets/jquery/dist/jquery.min.js') }}"></script>
	
	<script src="{{ url('assets/store.js/store.min.js') }}"></script>
	<script src="{{ url('assets/lodash/lodash.min.js') }}"></script>
	<script src="{{ url('assets/handlebars/handlebars.min.js') }}"></script>

	@yield('news_script')
	@yield('settings_script')
</body>
</html>
