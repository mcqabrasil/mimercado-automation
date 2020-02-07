require_relative '../app/page methods/cart_met'
require_relative '../app/page methods/home_met'
require_relative '../app/page methods/header_met'
require_relative '../app/page methods/mega-menu_met'
require_relative '../app/assertions/cart_assert'
require_relative '../app/assertions/header_assert'
require_relative '../app/assertions/footer_assert'
require_relative '../app/assertions/pdp_assert'
require_relative '../app/assertions/plp_assert'
require_relative '../app/assertions/home_assert'
require_relative '../app/assertions/mega-menu_assert'


describe 'test' do
  before(:all) do
    # @cart = CartMethods.new
    @cart_as = CartAssertions.new
    @header_as = HeaderAssertions.new
    @header_met = HeaderMethods.new
    @footer_as = FooterAssertions.new
    @home_met = HomeMethods.new
    @pdp_as = PDPAssertions.new
    @pdp_met = PDPMethods.new
    @plp_as = PLPAssertions.new
    @home_as = HomeAssertions.new
    @mm_met = MegaMenuMethods.new
    @mm_as = MegaMenuAssertions.new

    visit '/'
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
    end

    it 'Product links should take user to the given PDP', :SMOKE_01_step3 do
      url = @home_met.get_product_url(0)
      puts "URL IS:  #{url}"
      @home_met.click_product_link(0)
      @pdp_as.assert_url_pdp(url)
    end

    it "'Ver todos los produtos' link should take user to the PLP", :SMOKE_01_step4 do
      @home_met.click_see_all_products
      @plp_as.assert_plp_url
    end

    it 'Categories link should take user to the given Category page', :SMOKE_01_step5 do
      cat_url = @home_met.get_category_url(2)
      puts "URL IS:  #{cat_url}"
      @home_met.click_category_link(2)
      @plp_as.assert_url_category(cat_url)
    end

    it "'Haz tu pedido hoy mismo!' button should take user to the PLP", :SMOKE_01_step6 do
      @home_met.click_order_btn
      @plp_as.assert_plp_url
    end

    it "'Ordena ahora' should take user to the PLP", :SMOKE_01_step7 do
      @home_met.click_order_now_btn
      @plp_as.assert_plp_url
    end

    it "'Aviso de privacidad' link should give user a pdf file", :SMOKE_01_step8 do
      # @home_met.click_terms_cond_link
      # @home_as.assert_pdf_file --- TO BE VERIFIED
    end

    it 'User should be able to scroll down page', :SMOKE_01_step9 do
     # @home_met.scroll_down
    #  @home_as.assert_scroll_down
    end

    it 'User should be able to scroll up page', :SMOKE_01_step10 do
     # @home_met.scroll_down
     # @home_met.scroll_up
    end

    it 'Main menu when clicked should open the Menu modal', :SMOKE_01_step11 do
      @header_met.click_menu
      @mm_as.assert_menu_opened
      @header_met.close_modal
    end

    it 'Click on X button from Menu modal should close the modal', :SMOKE_01_step12 do
      @header_met.click_menu
      @header_met.close_modal
    end

    it 'Navigate through the Menu categories should take user to the given Menu sub-categories section', :SMOKE_01_step13 do
      @header_met.click_menu
      @mm_met.click_category_menu(02)

    end

    it 'Click on the sub-categories should take user to the given category page', :SMOKE_01_step14 do
    end

    it 'Click on the cart price in Header, should open Cart modal', :SMOKE_01_step15 do
    end

    it 'Click on the basket icon should open Cart modal', :SMOKE_01_step16 do
    end

    it 'Search for an existent product should bring results for the user', :SMOKE_01_step17 do
    end
  end
end
