class RenamePayTypesIntoPaymentTypes < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :payment_type_id, :payment_type_id
  end
end
