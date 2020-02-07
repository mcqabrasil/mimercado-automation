# Class to do the elements actions
require_relative '../pages/mega-menu_page'

class MegaMenuMethods < MegaMenuPage
  include Capybara::DSL

  def is_menu_opened?
    has_selector?(:dt, MENU_MODAL)
  end

  def close_menu
    find(:dt, CLOSE_MODAL).click
  end

  def click_category_menu(index)
    all(:dt, CATEGORY_LINK)[index].click
  end
end