<script id="items-template" type="text/x-handlebars-template">
	{{#each items}}
	<li class="item">
		<a href="{{url}}">
			<span class="item-title">{{title}}</span>
			<span class="item-info">{{source}}</span>
		</a>
	</li>	
	{{/each}}
</script>