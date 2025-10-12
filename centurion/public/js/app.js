$(document).ready(function() {

	// Lightweight autocomplete implementation using fetch + datalist
	// For each input with class .select-*, fetch suggestions from /select2/
	function attachAutocomplete($input, hiddenSelector, fieldName) {
		var listId = 'list-' + fieldName;
		var $datalist = $('#' + listId);
		if ($datalist.length === 0) {
			$datalist = $('<datalist id="' + listId + '"></datalist>').appendTo('body');
		}

		$input.attr('list', listId);

		var fetchTimer = null;
		$input.on('input', function() {
			var q = $(this).val();
			if (fetchTimer) clearTimeout(fetchTimer);
			if (!q) return;
			fetchTimer = setTimeout(function() {
				fetch('/select2/?name=' + encodeURIComponent(fieldName) + '&q=' + encodeURIComponent(q), {
					method: 'GET',
					headers: { 'Accept': 'application/json' }
				}).then(function(resp) { return resp.json(); })
				.then(function(data) {
					$datalist.empty();
					data.results.forEach(function(item) {
						// option value is the display text, we put id in data-id for later
						var $opt = $('<option></option>').attr('value', item.text).attr('data-id', item.id);
						$datalist.append($opt);
					});
				}).catch(function(err) {
					console.error('autocomplete fetch error', err);
				});
			}, 250);
		});

		// when user picks an option or leaves the field, try to find exact match
		$input.on('change blur', function() {
			var val = $(this).val();
			var matched = $datalist.find('option').filter(function() { return $(this).val() === val; }).first();
			if (matched.length) {
				var id = matched.attr('data-id');
				$(hiddenSelector).val(val);
				$(hiddenSelector).data('remote-id', id);
			} else {
				// If no exact match, clear hidden so server doesn't match on partial
				$(hiddenSelector).val('');
				$(hiddenSelector).data('remote-id', '');
			}
		});
	}

	var fields = [
		{ selector: '.select-name', hidden: '#hidden_name', name: 'name' },
		{ selector: '.select-category', hidden: '#hidden_category', name: 'category' },
		{ selector: '.select-unit', hidden: '#hidden_unit', name: 'unit' },
		{ selector: '.select-currency', hidden: '#hidden_currency', name: 'currency' },
		{ selector: '.select-company', hidden: '#hidden_company', name: 'company' },
		{ selector: '.select-project', hidden: '#hidden_project', name: 'project' },
		{ selector: '.select-city', hidden: '#hidden_city', name: 'city' }
	];

	fields.forEach(function(f) {
		var $el = $(f.selector);
		if ($el.length) {
			attachAutocomplete($el, f.hidden, f.name);
		}
	});

	// On submit, ensure hidden fields carry the visible values (if exact match)
	$('form').on('submit', function() {
		fields.forEach(function(f) {
			var $visible = $(f.selector);
			var $hidden = $(f.hidden);
			if ($visible.length && $hidden.length) {
				var val = $visible.val();
				// If hidden was already set by change/blur, keep it. Otherwise set text.
				if (!$hidden.val()) {
					$hidden.val(val);
				}
			}
		});
	});

});