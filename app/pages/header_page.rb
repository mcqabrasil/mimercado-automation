# frozen_string_literal: true

# Class to get the elements content
class HeaderPage
  include Capybara::DSL

  # Others
  HEADER_PATH = '//*[@id="viewport"]/div[1]/header' # CSS
  HEADER_LOGO = '//*[@id="viewport"]/div[1]/header/div[1]/div/div[1]/div[2]/a' # xpath

  # LABELS / LINK
  CART_PRICE = '//*[@id="viewport"]/div[1]/header/div[1]/div/div[3]/div/div/span' # PROVISORIO

  # BUTTONS
  CART_BTN = 'openMicrocart'
  MENU_BTN = 'menuButton'
  CLOSE_MODAL_BTN = 'closeMicrocart'

  # MODALS
  CART_MODAL = 'microcart'

  # FIELDS
  SEARCH_HEADER = 'openSearchPanel'
  SEARCH_FLD = 'search' # id

end
