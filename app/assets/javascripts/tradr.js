$(document).ready( function () {
	var show_chart = function () {
		var symbol = $('#symbols').val();

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
			data: symbols,
			xkey: 'quote',
			ykeys: ['purchase_price'],
			labels: ['Purchase_price']
		});
		console.log(process_symbol);
	};

	$('#show_chart').click(show_chart).trigger('click');
});