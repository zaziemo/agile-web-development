class AddPayTypeIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :payment_type_id, :integer
  end
end
