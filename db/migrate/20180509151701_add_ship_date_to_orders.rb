class AddShipDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :ship_date, :DateTime
  end
end
