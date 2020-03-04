
require_relative '../app/page methods/utils'
require_relative '../app/assertions/header_assert'
require_relative '../app/assertions/footer_assert'
require_relative '../app/assertions/home_assert'
require_relative '../app/assertions/mega-menu_assert'
require_relative '../app/assertions/plp_assert'
require_relative '../app/page methods/home_met'
require_relative '../app/page methods/mega-menu_met'
require_relative '../app/page methods/footer_met'
require_relative '../app/page methods/header_met'
require_relative '../app/page methods/cart_met'

describe 'Smoke Test' do
  before(:all) do
    @utils = Utils.new
    @header_as = HeaderAssertions.new
    @header = HeaderMethods.new
    @foo_as = FooterAssertions.new
    @foo = FooterMethods.new
    @home_as = HomeAssertions.new
    @home = HomeMethods.new
    @plp_as = PLPAssertions.new
    @mm_as = MegaMenuAssertions.new
    @mm = MegaMenuMethods.new
    @cart = CartMethods.new

    visit '/'
    @home.click_close_cookies
  end

  context 'Check Home page, Header and Footer links', :SMOKE_01 do
    it 'Header should be present with its components', :SMOKE_01_step1 do
      @header_as.assert_header_visible
      @header_as.assert_logo_visible
      @header_as.assert_cart_price_visible
      @header_as.assert_cart_icon_visible
      @header_as.assert_search_visible
      @header_as.assert_menu_btn_visible
    end

    it 'Footer should be present with its components', :SMOKE_01_step2 do
      @foo_as.assert_content_visible
    end

    it 'It should take user to the given PDP', :SMOKE_01_step3 do
      @home_as.assert_products_links_goto_pdp
    end

    it 'It should take user to the PLP', :SMOKE_01_step4 do
      @home.click_see_all_products
      @plp_as.assert_plp_url
    end

    it 'It should take user to the given Category page', :SMOKE_01_step5 do
      @home_as.assert_category_links_goto_clp
    end

    it 'It should take user to the Product Listing page', :SMOKE_01_step6 do
      @home.click_order_today_btn
      @plp_as.assert_plp_url
    end

    it 'It should open Menu modal', :SMOKE_01_step7 do
      @home.click_order_now_btn
      sleep 2
      @mm_as.assert_menu_opened
     # @mm.close_menu
    end

    it 'It should give user a pdf file', :SMOKE_01_step8 do
      #
    end

    it 'User should be taken to the FAQ page', :SMOKE_01_step9 do
      @foo.click_faq_link
      @foo_as.assert_faq_url
    end

    it 'It should open the Menu modal', :SMOKE_01_step10 do
      @header.click_menu
      sleep 2
      @mm_as.assert_menu_opened
    end

    it 'It should close the modal', :SMOKE_01_step11 do
      @header.click_menu
      @mm.close_menu
      sleep 2
      @mm_as.assert_menu_closed
    end

    it 'It should take user to the given Menu sub-categories section', :SMOKE_01_step12 do
      @header.click_menu
      @mm_as.assert_main_category_goto_l1
    end

    it 'It should take user to the given category page', :SMOKE_01_step13 do
      @mm_as.assert_l2_category_goto_clp
    end

    it 'It should open Cart modal', :SMOKE_01_step14 do
      @header.click_cart_price
      @header_as.assert_cart_modal_opened
    end

    it 'It should close Cart modal', :SMOKE_01_step15 do
      @header.click_cart_price
      @cart.click_close_cart_modal
      sleep 2
      @header_as.assert_cart_modal_closed
    end

    it 'It should bring results for the user', :SMOKE_01_step16 do
      @utils.do_search('coca cola')
      @plp_as.assert_search_results_match('coca cola')
    end
  end
end