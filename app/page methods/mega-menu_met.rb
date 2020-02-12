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

  def click_category_by_name(name)
    all(:dt, CATEGORY_LINK, text: name)
  end

  def get_categories_url
    within('.sidebar-menu__container') do
      page.execute_script "window.scrollBy(0,10000)"
      all('a').each { |a| a[:href] }
    end
  end

  def click_my_account
    find(:dt, MY_ACCOUNT_LINK).click
  end
end