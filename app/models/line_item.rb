class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart

  EXCHANGE_RATE_DOLLAR_TO_EUR = 0.87

  def total_price
    if I18n.locale == :en
      price * quantity
    else
      localized_price * quantity
    end
  end

  def set_localized_price
    update!(localized_price: (price.round(2) * EXCHANGE_RATE_DOLLAR_TO_EUR))
  end
end
