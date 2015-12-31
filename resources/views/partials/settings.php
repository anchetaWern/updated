<script id="settings-template" type="text/x-handlebars-template">
	{{#each categories}}
	<li class="category" data-category="{{name}}">
	{{name}}
	{{#each sources}}
	<div class="sources">      
		<label>
		    <input type="checkbox" class="setting" data-key="{{@key}}" data-route="{{route}}" {{check enabled}}>
		    <span class="checkable">{{name}}</span>
		</label>
	</div>
	{{/each}}
	</li>
	{{/each}}
</script>