class AddCurrencyAndLocalizedPriceToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :currency, :string
    add_column :line_items, :localized_price, :decimal, precision: 8, scale: 2
  end
end
