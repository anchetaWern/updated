var items_template = Handlebars.compile($('#items-template').html());
var categories_template = Handlebars.compile($('#categories-template').html());
var categories_mobile_template = Handlebars.compile($('#categories-mobile-template').html());

var timeout = 100;
if(!store.get('categories')){
	timeout = 1000;
	$.getJSON('/files/settings.json', function(response){
		store.set('categories', response);
		store.set('settings', response);
	});
}

setTimeout(function(){

	var path = window.location.pathname;
	if(path == '/'){
		path = '/hn';
	}
	$('a[href="' + path + '"]').addClass('active');

	$('#items').on('click', '.item-link', function(){
		$(this).siblings('.actions').children('a').removeClass('hidden');
	});

	$('#news_sources').change(function(){
		var value = $(this).val();
		window.location.href = value;
	});

	var categories = store.get('categories');

	var category = 'hn';
	var path_array = window.location.pathname.split('/');
	if(path_array[1] != ''){
		category = path_array[1];
	}

	var current_category = _.find(categories, function(cat) {
	  return cat.name == category;
	});

	var enabled_sources = _.filter(current_category.sources, function(src){
	  return src.enabled;
	});

	var enabled_categories = _.filter(categories, function(cat){
		return cat.enabled;
	});

	var categories_html = categories_template({'categories': enabled_categories});
	$('#nav ul').html(categories_html).removeClass('hidden');

	var categories_mobile_html = categories_mobile_template({'categories': enabled_categories});
	$('#mobile-nav #news_sources').html(categories_mobile_html).removeClass('hidden');

	$("a[href='/" + category + "']").addClass('active');
	$("option[value='/" + category + "']").prop('selected', true);

	var requests = [];


	if(enabled_sources.length > 0){
		for(var x in current_category.sources){

			var source = current_category.sources[x];
			if(source.enabled){		
			console.log(source);

				requests.push(
					$.getJSON('/files/' + source.route + '.json')
				);
			}
		}
	}else{	
		requests.push(
			$.getJSON('/files/' + current_category.name + '.json')
		);
	}


	$.when.apply($, requests).then(function(){
		args = arguments;
		var news_items = [];
		
		if(enabled_sources.length > 1){
			for(var x in arguments){
				if(arguments[x] instanceof Array){		
					var items = arguments[x][0];
					
					for(var y in items){
						var item = items[y];
						news_items.push(item);
					}
				}
			}
		}else if(enabled_sources.length <= 1){
			
			var items = arguments[0];
			for(var y in items){
				var item = items[y];
				news_items.push(item);
			}
		}

		var items_html = items_template({'items': news_items});
		$('#items').html(items_html).removeClass('hidden');

	});
}, timeout);


	
