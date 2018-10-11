class RemoveCurrenyFromLineItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :line_items, :currency, :string
  end
end
