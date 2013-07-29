$(document).ready( function () {
	var show_chart = function () {
		var symbol = $('#symbols').val();
		symbol = symbol.replace('.','-');
		$.ajax({
			dataType: 'json',
			type: 'GET',
			url: '/stocks/chart/' + symbol
		}).done(process_symbol);
	};

	var process_symbol = function (stocks) {
		$('#chart').empty();
		new Morris.Line({
			element: 'chart',
			data: stocks,
			xkey: 'quote',
			ykeys: ['purchase_price'],
			labels: ['Purchase_price']
		});

	};

	$('#show_chart').click(show_chart).trigger('click');
});