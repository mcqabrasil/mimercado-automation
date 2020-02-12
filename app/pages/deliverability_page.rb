# frozen_string_literal: true

# Class to get the elements content
class DeliverabilityPage
  include Capybara::DSL

  # Buttons
  CLOSE_DELIVERY_ZONE_BTN = 'close-deliverability'
  CONFIRM_DIRECTION_BTN = 'confirm-direction'

  # Fields
  ADDRESS_FLD = 'gmap-autocomplete'

  # Modal
  DELIVERABILITY_MD = 'sidebar'

end
  