$(document).ready(function() {

	// Use select2 with bootstrap4 theme for all select elements.
	$('select').select2({
		theme: 'bootstrap4',
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
			theme: 'bootstrap4',
			language: 'pl',
		});
	};

	var selectors = [$('.select-name'), $('.select-unit'), $('.select-company'), $('.select-project'), $('.select-city')];
	selectors.map(autocomplete);

	$('.select-button').click(function() {
		$('#hidden_name').val($('.select-name').select2('data')[0].text);
		$('#hidden_category').val($('.select-category').val());
		$('#hidden_unit').val($('.select-unit').select2('data')[0].text);
		$('#hidden_currency').val($('.select-currency').val());
		$('#hidden_company').val($('.select-company').select2('data')[0].text);
		$('#hidden_project').val($('.select-project').select2('data')[0].text);
		$('#hidden_city').val($('.select-city').select2('data')[0].text);
	});

});