# frozen_string_literal: true

require_relative '../app/page methods/cart_met'
require_relative '../app/page methods/home_met'
require_relative '../app/page methods/header_met'
require_relative '../app/page methods/mega-menu_met'
require_relative '../app/page methods/deliverability_met'
require_relative '../app/assertions/cart_assert'
require_relative '../app/assertions/header_assert'
require_relative '../app/assertions/footer_assert'
require_relative '../app/assertions/pdp_assert'
require_relative '../app/assertions/plp_assert'
require_relative '../app/assertions/home_assert'
require_relative '../app/assertions/mega-menu_assert'
require_relative '../app/assertions/deliverability_assert'

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
    @dev_assert = DeliverabilityAssertions.new
    @dev_met = DeliverabilityMethods.new

    visit '/'
    # @url_vl = "https://storefront-qa.mimercado.com/bebidas/refrescos/refresco-de-cola/refresco-de-cola-214/coca-cola-refresco-retornable-botellas-de-3-litros-599.html"
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
      @mm_met.click_category_menu(0o2)
      # to be done
    end

    it 'Click on the sub-categories should take user to the given category page', :SMOKE_01_step14 do
    end

    it 'Click on the cart price in Header, should open Cart modal', :SMOKE_01_step15 do
      @header_met.click_cart_price
      @header_as.assert_cart_modal_opened
    end

    it 'Click on the basket icon should open Cart modal', :SMOKE_01_step16 do
      @header_met.click_basket_button
      @header_as.assert_cart_modal_opened
    end

    it 'Search for an existent product should bring results for the user', :SMOKE_01_step17 do
      @header_met.do_search('coca cola')
      # need assertion
    end
  end

  context 'Check PDP', :SMOKE_02 do
    it 'Product image should be present', :SMOKE_02_step01 do
    end

    it 'User should see product description', :SMOKE_02_step02 do
      visit '/'
      @home_met.click_product_link(1)
      @pdp_assert.assert_product_name_presence
    end

    it 'User should see product unit price (c/u) for common product', :SMOKE_02_step03 do
      url = 'https://storefront-qa.mimercado.com/p/LIMFAB09/fabuloso-limpiador-multiusos-frescura-profunda-pasion-de-frutas-12-botellas-de-1-litro/-1178'
      @pdp_met.goto_specifc_pdp(url)
      @pdp.assert_product_price_presence
    end

    it 'User should see product unit price (c/u) for volume discount product', :SMOKE_02_step04 do
      @pdp_met.goto_specifc_pdp(@url_vl)
      @pdp.assert_product_price_presence
    end

    it 'Quantity field should start in 1', :SMOKE_02_step05 do
      @home_met.click_product_link(2)
      @pdp_assert.assert_prod_start_qty
    end

    it 'Invalid quantity should disable “Add to Cart” button', :SMOKE_02_step06 do
      @pdp_met.set_quantity(0)
      @pdp_assert.assert_add_to_cart_btn_disabled
    end

    it 'User should see similar products section', :SMOKE_02_step07 do
      @pdp_assert.assert_similiar_prod_presence
    end

    it 'Product with volume discount should calculates the price corectly', :SMOKE_02_step08 do
    end

    it 'Anonymous user should inform deliver zone to add a product to cart', :SMOKE_02_step09 do
      @pdp_met.click_add_to_cart_btn
      @dev_assert.assert_modal_open

      @dev_met.fill_address_zone('Mexico City Marriott Reforma Hotel, Avenida Paseo de la Reforma, Juárez, Ciudad de México, CDMX')
      @dev_met.click_confirm_direction_btn
    end

    it 'Logged users should be able to add product to cart without have to fill deliver zone', :SMOKE_02_step10 do
    end

    it 'Anonymous user should be able to add product to cart if informed attended direction', :SMOKE_02_step11 do
    end

    it 'Anonymous user should not be able to add product to cart if informed a not attended direction', :SMOKE_02_step12 do
    end
  end
end
