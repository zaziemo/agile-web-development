require 'test_helper'

class CartTest < ActiveSupport::TestCase
fixtures :products

  test "add two different products" do
    cart = Cart.create
    cart.add_product(products(:ruby)).save!
    cart.add_product(products(:two)).save!

    assert_equal cart.line_items.size, 2
    assert_equal cart.line_items[0].quantity, 1
    assert_equal cart.line_items[1].quantity, 1
  end

  test "add two items of the same product" do
    cart = Cart.create
    2.times { cart.add_product(products(:ruby)).save! }
    # cart.add_product(products(:ruby)).save!

    assert_equal cart.line_items.size, 1
    assert_equal cart.line_items[0].quantity, 2
  end
end
