require_relative '../app/page methods/utils'

describe 'Demo Test' do
  before(:all) do
    @utils = Utils.new

    visit '/'
    @utils.login(48991200113)
   end

   after(:each) do
    page.instance_variable_set(:@touched, false)
  end

  after(:all) do
    page.instance_variable_set(:@touched, true)
    page.reset!
  end
  
  context 'Demo-basic workflow', :demo do
    it 'User should be able to add product on cart', :demo_01 do
      @utils.logged_add_to_cart(1, 2)
    end

    it 'User should be able to place an order', :demo_02 do
      @utils.do_checkout_logged
    end
  end

end