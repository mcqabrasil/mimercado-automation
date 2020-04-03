# frozen_string_literal: true

require_relative '../page methods/home_met'

class HomeAssertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @home = HomeMethods.new
  end

  def assert_scroll_down
    if @home.footer_visible?
      puts 'Scroll down successfully'
    else
      expect { raise 'oops' }.to raise_error('Not able to scroll down')
    end
  end

  def assert_products_links_goto_pdp # fazer depois, jogar em uma array
    index = 0
    until @home.get_product_url(index).nil?
      puts "index: #{index}"
      url = @home.get_product_url(index)
      @home.click_product_link(index)
      expect(page).to have_current_path(url.to_s)
      visit '/'
      index += 1
    end
  end

  def assert_category_links_goto_clp # fazer depois, jogar em uma array
    index = 0
    until @home.get_category_url(index).nil?
      puts "index: #{index}"
      url = @home.get_category_url(index)
      @home.click_category_link(index)
      expect(page).to have_current_path(url.to_s)
      visit '/'
      index += 1
    end
  end
end
