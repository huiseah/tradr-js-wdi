$(document).ready( function () {
	var show_chart = function (charts) {
		debugger;
		$('#chart').empty();

		$.each(charts, function (i, symbol) {
			$.ajax({
				dataType: 'json',
				type: 'GET',
				url: '/stocks/chart/' + symbol
			}).done(process_symbol);
		});
	};

	var process_symbol = function (stocks) {
		var nchart = $('<div>').appendTo('#chart');
		new Morris.Line({
			element: nchart,
			data: stocks,
			xkey: 'quote',
			ykeys: ['purchase_price'],
			labels: ['Purchase_price']
		});

	};

	$('#cell').on('change', ':checkbox', function() {
			var $parent = $(this).parent();
			var $checked = $parent.find(':checked');

			var chart = [];
			charts = $checked.map( function () {
				return $(this).attr('name');
			}).get();

			show_chart(charts);
		})
});