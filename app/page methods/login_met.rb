require_relative '../pages/login_page'

class LoginMethods < LoginPage
  include Capybara::DSL

  def choose_brazil_country
    find(COUNTRY_DP).click
    find(:xpath, BRAZIL_OPT).click
  end

  def fill_phone_number(phone)
    find(PHONE_FLD).set(phone)
  end

  def click_submit
    find(:dt, SUBMIT).click
  end

  def fill_sms_code
    fill_in FIRST_CODE_FLD, with: 0
    fill_in SECOND_CODE_FLD, with: 0
    fill_in THIRD_CODE_FLD, with: 0
    fill_in FOURTH_CODE_FLD, with: 0
    fill_in FIFITH_CODE_FLD, with: 0
    fill_in SIXTH_CODE_FLD, with: 0
  end
end