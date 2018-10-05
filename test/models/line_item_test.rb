require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  fixtures :line_items

  test "should set the correct localized price" do
    line_item = line_items(:one)

    line_item.update!(price: 9.99)
    line_item.set_localized_price

    assert_equal 8.69, line_item.localized_price.to_f
  end
end
