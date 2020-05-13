# frozen_string_literal: true

require_relative '../app/page methods/utils'
require_relative '../app/assertions/header_assert'
require_relative '../app/assertions/footer_assert'
require_relative '../app/assertions/home_assert'
require_relative '../app/assertions/mega-menu_assert'
require_relative '../app/assertions/plp_assert'
require_relative '../app/assertions/pdp_assert'
require_relative '../app/page methods/home_met'
require_relative '../app/page methods/mega-menu_met'
require_relative '../app/page methods/footer_met'
require_relative '../app/page methods/header_met'
require_relative '../app/page methods/cart_met'
require_relative '../app/page methods/pdp_met'
require_relative '../app/page methods/plp_met'
#require 'report_builder'

describe 'Smoke Test', :aggregate_failures, :SMOKE do

  before(:all) do
    @utils = Utils.new
    @header_as = HeaderAssertions.new
    @header = HeaderMethods.new
    @foo_as = FooterAssertions.new
    @foo = FooterMethods.new
    @home_as = HomeAssertions.new
    @home = HomeMethods.new
    @plp_as = PLPAssertions.new
    @plp = PlpMethods.new
    @mm_as = MegaMenuAssertions.new
    @mm = MegaMenuMethods.new
    @cart = CartMethods.new
    @pdp = PDPMethods.new
    @pdp_as = PDPAssertions.new

    visit '/'
    @home.close_popup
    @home.click_close_cookies
  #  @utils.login(48991200113)
  #  @utils.clear_cart
  end

  #verificar
  before(:SMOKE_01_step1, :SMOKE_01_step8, :SMOKE_01_step9,
         :SMOKE_01_step10, :SMOKE_01_step11, :SMOKE_01_step16, :SMOKE_01_step18) do
    visit '/'
  end

  after(:each) do
    page.instance_variable_set(:@touched, false)
  end

  after(:all) do
    page.instance_variable_set(:@touched, true)
    page.reset!
  #  @utils.logoff
  end

  context 'Check Home page, Mega-menu, Header and Footer links', :SMOKE_01 do
    it 'Header should be present with its components', :SMOKE_01_step1 do
      @header_as.assert_header_compoments_visible
    end

    it 'Footer should be present with its components', :SMOKE_01_step2 do
      page.execute_script "window.scrollBy(0,10000)"
      @foo_as.assert_footer_components_visible
    end

    # it 'It should take user to the given PDP', :SMOKE_01_step3 do
    #   @home_as.assert_products_links_goto_pdp
    # end

    # it 'It should take user to the PLP', :SMOKE_01_step4 do
    #   @home.click_see_all_products
    #   @plp_as.assert_plp_url
    # end

    # it 'It should take user to the given Category page', :SMOKE_01_step5 do
    #   @home_as.assert_category_links_goto_clp
    # end

    # it 'It should take user to the Product Listing page', :SMOKE_01_step6 do
    #   @home.click_order_today_btn
    #   sleep 2
    #   @plp_as.assert_plp_url
    # end

    # it 'It should open Menu modal', :SMOKE_01_step7 do
    #   @home.click_order_now_btn
    #   sleep 2
    #   @mm_as.assert_menu_opened
    #   @mm.close_menu
    # end

    it 'User should be taken to the "Terminos y condiciones" page.', :SMOKE_01_step8 do
      page.execute_script "window.scrollBy(0,10000)"
      @foo.click_tc_link
      @foo_as.assert_tc_url_path
    end

    it 'Click on the "Política de devoluciones" link.', :SMOKE_01_step9 do
      page.execute_script "window.scrollBy(0,10000)"
      @foo.click_returns_policy_link
      @foo_as.assert_returns_policy_url_path
    end

    it 'It should take user to the "Aviso de privacidad" page.', :SMOKE_01_step10 do
      page.execute_script "window.scrollBy(0,10000)"
      @foo.click_privacy_link
      @foo_as.assert_privacy_url_path
    end

    it 'User should be taken to the FAQ page', :SMOKE_01_step11 do
      page.execute_script "window.scrollBy(0,10000)"
      @foo.click_faq_link
      @foo_as.assert_faq_url
    end

    # it 'It should open the Menu modal', :SMOKE_01_step12 do
    #   @header.click_menu
    #   sleep 2
    #   @mm_as.assert_menu_opened
    #   @mm.close_menu
    # end

    # it 'It should close the modal', :SMOKE_01_step13 do
    #   @header.click_menu
    #   @mm.close_menu
    #   sleep 2
    #   @mm_as.assert_menu_closed
    # end

    # it 'It should take user to the given Menu sub-categories section', :SMOKE_01_step14 do
    #   @header.click_menu
    #   @mm_as.assert_main_category_goto_l1
    # end

    # it 'It should take user to the given category page', :SMOKE_01_step15 do
    #   @mm_as.assert_l2_category_goto_clp
    # end

    it 'It should open Cart modal', :SMOKE_01_step16 do
      @header.click_cart_price
      @header_as.assert_cart_modal_opened
    end

    # it 'It should close Cart modal', :SMOKE_01_step17 do
    #  # @cart.click_close_cart_modal
    #   @header.click_cart_price
    #   @cart.click_close_cart_modal
    #   sleep 2
    #   @header_as.assert_cart_modal_closed
    # end

    it 'It should bring results for the user', :SMOKE_01_step18 do
      @utils.do_search('coca')
      @plp_as.assert_search_results_match('coca')
    end
  end

  context 'Check PDP', :SMOKE_02 do
    it 'User should see product description' do
      visit("1-2-3-aceite-vegetal-mediano-caja-con-12-botellas-de-1-litro.html")
      @pdp_as.assert_product_name_presence
    end

    it 'User should see product unit price' do
      @pdp_as.assert_product_price_presence
    end

    it 'User should be able to edit quantity' do
      @pdp.set_quantity(2)
      @pdp_as.assert_quantity_value(2)
    end

    it 'User should be able to add product to cart without have to fill deliver zone' do
      @pdp.click_add_to_cart_btn
      @pdp_as.assert_prod_added_cart_notification
      sku = @pdp.get_sku
      puts @pdp.get_sku
      @header.click_cart_price
      @pdp_as.assert_prod_added_to_cart(sku)
     # @cart.click_close_cart_modal
    end
  end

  context 'Check PLP', :SMOKE_03 do
    it 'It should be displayed followed by its product image, name, price, volume', :test do
      @plp.goto_plp
      # missing volume/size - precisa do datatestid
      @plp_met.get_product_image(0)
      puts @plp_met.get_product_image(0)
    end

    it 'It should shows products from the given category' do

    end

    it 'It should shows products from the given mark.' do

    end
  end
end
