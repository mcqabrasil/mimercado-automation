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

  def get_all_category_menu_title(index)
    categories = all(:dt, MAIN_CATEGORY_BTN)
    if index < categories.size
      return categories[index].text
    end
    return nil
  end

  def click_all_category_menu(index)
    if index < all(:dt, MAIN_CATEGORY_BTN).size
      return all(:dt, MAIN_CATEGORY_BTN)[index].click
    end
    return nil
  end

  def click_category_menu(index)
    page.execute_script "document.getElementsByClassName('sidebar-menu__container')[0].scrollBy(0,10000)"
    all(:dt, MAIN_CATEGORY_BTN)[index].click
  end

  def get_l1_title
    find(:dt, L1_TITLE_LBL).text
  end

  def get_l1_categories_url(index)
    if index < all(:dt, L1_CATEGORY_LINK).size
      return all(:dt, L1_CATEGORY_LINK)[index][:href]
    end
    return nil
  end

  def click_l1_category(index)
    page.execute_script "document.getElementsByClassName('sidebar-menu__container')[0].scrollBy(0,-10000)"
    all(:dt, L1_CATEGORY_LINK)[index].click
  end

  def click_my_account
    find(:dt, MY_ACCOUNT_LINK).click
  end

  def click_back_menu
    find(:dt, BACK_MENU_BTN).click
  end
end