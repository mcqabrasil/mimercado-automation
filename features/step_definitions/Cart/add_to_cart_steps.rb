# @MG-275_01
Given('I have no item in the cart') do
  @cart_met.clean_cart
end
Given('I am at the PDP page') do
  @plp_met.click_prod_from_list(0)
end
When('I add the product to the cart with a valid quantity') do
  @pdp_met.set_quantity(2)
  @pdp_met.click_add_to_cart_btn
end
Then('I should see the price total next to the cart icon') do
  using_wait_time 80 do
    @header_assert.assert_price_present_basket
  end
end
Then('I should see the product on the cart page') do
  @cart_met.click_basket_button
  @cart_assert.assert_product_on_cart('24-WG087')
end

# @MG-275_03
Given('I have added a product to the cart') do
  @pdp_met.add_product_to_cart(0, 1)
end
When("I click on the 'OK' button from the cart notification") do
  using_wait_time 5 do
    @pdp_met.click_ok_notification
  end
end
Then('I should see the notification be closed') do
  @pdp_assert.assert_notification_is_closed
end
Then('I should stay at the pdp page') do
  # to be verified with development
end

# @MG-275_04
When("I click on the 'Proceed To Checkout' button from the cart notification") do
  using_wait_time 5 do
    @pdp_met.click_proceed_to_cart_notification
  end
end
Then('I should be taken to the checkout page') do
  @pdp_assert.assert_url_ison_checkout_page
end

# @MG-275_05
Then('I should see the added to cart notification message briefly') do
  text_a = 'Product has been added to the cart!'
  using_wait_time 15 do
    @pdp_assert.assert_cart_notification_msg(text_a)
  end
end
When('I click to add the product again to cart') do
  sleep 10
  @pdp_met.click_add_to_cart_btn
end
Then('I should see the quantity updated notification message briefly') do
  text_b = 'Product quantity has been updated!'
  using_wait_time 15 do
    @pdp_assert.assert_cart_notification_msg(text_b)
  end
end

# @MG-275_06
When('I add the product to the cart with zero quantity') do
  @pdp_met.set_quantity(0)
end
Then('I should an error message informing quantity must be above zero') do
  msg = 'Quantity must be above 0'
  @pdp_assert.assert_quantity_error_message(msg)
end
Then('I should see the Add to Cart button be disabled') do
  @pdp_assert.assert_add_to_cart_btn_disabled
end
