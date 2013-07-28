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
		@auth.stocks << stock
		@stocks = @auth.stocks.order(:symbol).order(:shares)
		@symbols = @auth.stocks.map(&:symbol).uniq.sort
	end

	def chart
		render :json => @auth.stocks.where(:symbol => params[:symbol])
	end

	private
	def only_authorized
		redirect_to(root_path) if @auth.nil?
	end
end

