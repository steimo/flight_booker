class AddPriceToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :price, :float
  end
end
