# == Schema Information
#
# Table name: stocks
#
#  id             :integer          not null, primary key
#  symbol         :string(255)
#  shares         :integer
#  purchase_price :decimal(, )
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  quote          :decimal(, )
#  name           :text
#

class Stock < ActiveRecord::Base
	attr_accessible :symbol, :shares, :purchase_price, :quote, :name
	belongs_to :user, :inverse_of => :stocks

	def get_quote (symbol)
  		if symbol.nil? or symbol.empty?
    	quote = ''
  		else
    	symbol = symbol.upcase
    	quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol].lastTrade
  		name = YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol].name
  		return quote
  	end
  end

  def get_name (symbol)
  		if symbol.nil? or symbol.empty?
    	name = ''
  		else
    	symbol = symbol.upcase
  		name = YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol].name
  		return name
  	end
  end
end
