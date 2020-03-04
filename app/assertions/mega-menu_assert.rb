require_relative '../page methods/pdp_met'
require_relative '../page methods/header_met'

class MegaMenuAssertions 
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @mm = MegaMenuMethods.new
    @header = HeaderMethods.new
  end

  def assert_menu_opened
    if @mm.is_menu_opened?
      puts 'Mega Menu modal is opened'
    else
      expect { raise "oops" }.to raise_error('Mega-Menu modal was not opened')
    end
  end

  def assert_menu_closed
    if @mm.is_menu_opened?
      expect { raise "oops" }.to raise_error('Mega-Menu modal is opened')
    else
      puts 'Mega Menu modal is closed'
    end
  end

  def assert_main_category_goto_l1
    index = 0
    until @mm.get_all_category_menu_title(index).nil?
      puts "index: #{index}"

      title = @mm.get_all_category_menu_title(index)
      puts "menu title> #{title}"

      @mm.click_category_menu(index)
      puts "sub title: #{@mm.get_l1_title}"

      if @mm.get_l1_title == title
        puts "Main category takes to the correct L1 menu category"
      else
        expect { raise "oops" }.to raise_error('Main category takes to incorrect L1 category')
      end

      @mm.click_back_menu
      index += 1
    end
  end


  def assert_l2_category_goto_clp
    @header.click_menu
    index = 0

    until @mm.get_all_category_menu_title(index).nil?
      @mm.click_category_menu(index)
      url = @mm.get_l1_categories_url(0)
      puts "Index: #{index}, Element url: #{url}"

      @mm.click_l1_category(0)
  
      using_wait_time 20 do
        expect(page).to have_current_path(url.to_s)
        puts "Current url: #{page.current_path}"
      end

      index += 1

      @header.click_menu
      @mm.click_back_menu
    end
  end
end