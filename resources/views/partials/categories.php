<script id="categories-template" type="text/x-handlebars-template">
	{{#each categories}}
	<li><a href="/{{route}}">{{name}}</a></li>
	{{/each}}
</script>