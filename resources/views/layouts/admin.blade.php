<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	@yield('title')
	<link rel="stylesheet" href="{{ url('assets/picnic/releases/picnic.min.css') }}">
	<link rel="stylesheet" href="{{ url('assets/css/style.css') }}">
</head>
<body>
	<div id="wrapper">
		@yield('content')
	</div>
	<script src="{{ url('assets/jquery/dist/jquery.min.js') }}"></script>
	@yield('update_source_script')
</body>
</html>