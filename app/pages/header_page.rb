# frozen_string_literal: true

# Class to get the elements content
class HeaderPage
  include Capybara::DSL

  # Others
  HEADER_PATH = '//*[@id="viewport"]/div[1]/header' # CSS
  HEADER_LOGO = '#viewport .header-logo' # CSS

  # LABELS / LINK
  CART_PRICE = '//*[@id="viewport"]/div[1]/header/div[1]/div/div[4]/div/div/span' # PROVISORIO

  # BUTTONS
  CART_BTN = 'openMicrocart'
  MENU_BTN = 'menuButton'
  CLOSE_MODAL_BTN = 'closeMicrocart'

  # FIELDS
  SEARCH_FLD = 'openSearchPanel'

end
