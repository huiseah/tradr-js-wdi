class AddQuoteStocksTable < ActiveRecord::Migration
  def change
  	add_column :stocks, :quote, :decimal
  end
end
