require_relative '../app/page methods/utils'
require_relative '../app/page methods/home_met'
require_relative '../app/assertions/checkout_assert'

describe 'Demo Test' do
  before(:all) do
    @utils = Utils.new
    @home = HomeMethods.new
    @checkout_as = CheckoutAssertions.new

    visit '/'
    @home.click_close_cookies
  #  @utils.login(48991200044)
   end

  after(:each) do
    #page.instance_variable_set(:@touched, false)
  end

  after(:all) do
  #  page.instance_variable_set(:@touched, true)
  #  page.reset!
  end

  context 'Demo-basic workflow', :demo do
    it 'User should be able to add product on cart', :demo_01 do
      @utils.logged_add_to_cart(0, 2)
    end

    it 'User should be able to place an order', :demo_02 do
      @utils.do_checkout_logged
      @checkout_as.assert_order_placed
    end

    it 'should add 100 products to cart', :hundred_prod do
      @utils.add_hundred_prod_to_cart
    end
  end

end