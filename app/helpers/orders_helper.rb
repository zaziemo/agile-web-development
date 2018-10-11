module OrdersHelper
  def available_payment_types
    [
      [t('orders.payment_types.check'), 1],
      [t('orders.payment_types.credit_card'), 2],
      [t('orders.payment_types.purchase_oder'), 3]
    ]
  end
end
