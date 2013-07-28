class AddNameStocksTable < ActiveRecord::Migration
  def change
  	add_column :stocks, :name, :text
  end
end
