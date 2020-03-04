
# Class to get the elements content
class MegaMenuPage
  include Capybara::DSL

  # Modals
  MENU_MODAL = 'sidebar' 
  CLOSE_MODAL = 'closeMicrocart'

  # Links
  MY_ACCOUNT_LINK = 'sideMenuClose'
  L1_CATEGORY_LINK = 'sideMenuSubcategory'
  L2_CATEGORY_LINK = 'sideMenuSubcategoryItem'

  # Buttons
  MAIN_CATEGORY_BTN = 'sideMenuCategory'
  BACK_MENU_BTN = 'sideMenuBack'

  # Labels
  L1_TITLE_LBL = 'sideMenuSubcategoryTitle'

end