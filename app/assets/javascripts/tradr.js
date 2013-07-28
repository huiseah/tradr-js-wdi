$(document).ready( function () {
	var show_chart = function () {
		var symbol = $('#symbols').val();

		$.ajax({
			dataType: 'json',
			type: 'GET',
			url: 'stocks/chart/' + symbol
		}).done(process_symbol);
	};

	var process_symbol = function (stocks) {
		$('#chart').empty();
		new Morris.Line({
			element: 'chart',
			data: symbols,
			xkey: 'purchase_price',
			ykeys: ['shares']
			labels: ['Shares']
		});
	};

	$('#show_chart').click(show_chart).trigger('click');
});