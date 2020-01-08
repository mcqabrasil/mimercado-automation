# @MG-276_02
Given('I am on the Shopping Cart page with an item in my cart') do
  @cart_met.add_tocart_if_itis_empty(0, 1)
  @deliver_met.fill_address_zone(' Avenida Paseo de la Reforma 276 Juárez, Ciudad de México')
  using_wait_time 5 do
    @deliver_met.click_confirm_direction_btn
  end
  @cart_met.click_basket_button
end
When('I click on Apply Discount Code') do
  @cart_met.click_apply_discount_code_btn
end
Then('I should see the Discount field be visible') do
  @cart_assert.assert_discount_fld_visible
end
When('I click on the link Apply Discount Code again') do
  @cart_met.click_apply_discount_code_btn
end
Then('I should see the Discount field be hidden') do
  @cart_assert.assert_discount_fld_hidden
end

# @MG-276_03
When('I inform an invalid cupom') do
  @cart_met.click_add_discount_code_btn
  @cart_met.fill_discount_code_fld('INCORRECTCUPOM')
  @cart_met.click_add_discount_code
end
Then('I should see an error message informing the code is invalid') do
  using_wait_time 5 do
    text = "You've entered an incorrect coupon code. Please try again."
    @cart_assert.assert_invalid_coupon_msg_display(text)
  end
end

# @MG-276_04
When('I inform a valid cupom') do
  @cart_met.click_add_discount_code_btn
  @cart_met.fill_discount_code_fld('10DISCOUNT')
  @cart_met.click_add_discount_code
end
Then('I should see the discount I informed be applied') do
  @cart_assert.assert_discount_code_applied
end
