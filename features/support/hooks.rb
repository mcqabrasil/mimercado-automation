Before do
  @pdp_assert = PDP_Assertions.new
  @header_assert = Header_Assertions.new
  @cart_assert = Cart_Assertions.new
  @pdp_met = PDPMethods.new
  @plp_met = PlpMethods.new
  @cart_met = CartMethods.new
  @header_met = HeaderMethods.new

  visit('/')
end
