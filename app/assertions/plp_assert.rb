
require_relative '../page methods/plp_met'

class PLPAssertions 
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @plp = PlpMethods.new
  end

  def assert_plp_url
    expect(page).to have_current_path("https://storefront-qa.mimercado.com/inicio")
  end

  def assert_url_category(url)
    expect(page).to have_current_path("#{url}")
  end

  def assert_search_results_match(text)
    if @plp.was_product_listed?
      index = 0
      until @plp.get_products_list_total_by_index(index).nil?
        puts index
        puts @plp.get_products_name(index).downcase
        expect(@plp.get_products_name(index).downcase).to include(text[0...2].downcase)

        index += 1
      end
    else
      expect { raise "oops" }.to raise_error('There are products not matching text searched')
    end
  end

  def  assert_plp_content

  end

end