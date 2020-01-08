# frozen_string_literal: true

class DeliverabilityMethods < DeliverabilityPage
  include Capybara::DSL

  def close_delivery_zone_modal
    find(:dt, CLOSE_DELIVERY_ZONE_BTN).click
  end

  def click_confirm_direction_btn
    find(:dt, CONFIRM_DIRECTION_BTN).click
    sleep 10
  end

  def fill_address_zone(address)
    fill_in ADDRESS_FLD, with: address
    sleep 2
    find(:nm, ADDRESS_FLD).send_keys :arrow_down
    sleep 2
    find(:nm, ADDRESS_FLD).send_keys :enter
  end
end
