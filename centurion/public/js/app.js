$(document).ready(function() {

	$('select').select2({
		theme: 'bootstrap-5',
		language: 'pl',
	});

	function autocomplete(selector) {
		return selector.select2({
			ajax: {
				type: 'POST',
				url: '/select2/',
				dataType: 'json',
				delay: 250,
				data: function (params) {
					return {
						name: this.attr('name'),
						q: params.term, // search term
					};
				},
				cache: true
			},
			minimumInputLength: 1,
			theme: 'bootstrap-5',
			language: 'pl',
		});
	};

	var selectors = [
		$('.select-name'),
		$('.select-category'),
		$('.select-unit'),
		$('.select-currency'),
		$('.select-company'),
		$('.select-project'),
		$('.select-city')
	];

	selectors.map(autocomplete);

	var hidden_fields = [
		$('#hidden_name'),
		$('#hidden_category'),
		$('#hidden_unit'),
		$('#hidden_currency'),
		$('#hidden_company'),
		$('#hidden_project'),
		$('#hidden_city'),
	];

	$('.select-button').click(function() {
		for (var i = 0; i < selectors.length; i++) {
			hidden_fields[i].val(selectors[i].select2('data')[0].text);
		}
	});

});