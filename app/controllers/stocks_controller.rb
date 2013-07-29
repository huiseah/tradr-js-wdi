class StocksController < ApplicationController
	before_filter :only_authorized

	def index
		@stocks = @auth.stocks.order(:symbol).order(:shares)
		@symbols = @auth.stocks.map(&:symbol).uniq.sort  #&:activity means 'get me only the activity field for each element in the array'
	end

	def new
		@stock = Stock.new
	end

	def create
		stock = Stock.create(params[:stock])
		@stocks = @auth.stocks.order(:symbol).order(:shares)
		@symbols = @auth.stocks.map(&:symbol).uniq.sort
		@symbol = stock.symbol
		stock.purchase_price = stock.get_quote(@symbol)
		stock.name = stock.get_name(@symbol)
		@auth.stocks << stock
	end

	def search
		stock = Stock.new
		@quote = stock.get_quote(params[:symbol])
		@name = stock.get_name(params[:symbol])
	end

	def chart
		render :json => @auth.stocks.where(:symbol => params[:symbol].gsub('-','.'))
	end

	private
	def only_authorized
		redirect_to(root_path) if @auth.nil?
	end
end

