var categories = store.get('categories');

Handlebars.registerHelper("check", function(status) {
  return (status) ? 'checked' : ''; 
});

var settings_template = Handlebars.compile($('#settings-template').html());
var settings_html = settings_template({'categories': categories});
$('#settings').html(settings_html);

$('#settings').on('click', '.setting', function(){

	var self = $(this);
	var route = self.data('route');
	var checked = self.is(':checked');

	
	var category = self.parents('li').data('category');

	var index = self.data('key');

	var parent_index = _.findIndex(categories, function(row){
	   return row.name === category;
	});

	categories[parent_index].sources[index].enabled = checked;

	store.set('categories', categories);
});


$('#news_sources').change(function(){
	var value = $(this).val();
	window.location.href = value;
});
