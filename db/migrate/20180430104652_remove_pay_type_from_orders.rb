class RemovePayTypeFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :pay_type, :string
  end
end
