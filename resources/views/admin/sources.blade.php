@extends('layouts.admin')

@section('title')
<title>News Sources</title>
@stop


@section('content')
<h2>News Sources</h2>
<table>
	<thead>
		<tr>
			<th>Title</th>
			<th>Update</th>
		</tr>
	</thead>
	<tbody>
	@foreach($sources as $src)
		<tr>
			<td>{{ $src->title }}</td>
			<td><a href="/source/{{ $src->id }}">update</a></td>
		</tr>
	@endforeach
	</tbody>
</table>
@stop