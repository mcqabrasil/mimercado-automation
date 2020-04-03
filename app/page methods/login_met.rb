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
    all(:css, SMS_CODE_FLD)[0].set(0)
    all(:css, SMS_CODE_FLD)[1].set(0)
    all(:css, SMS_CODE_FLD)[2].set(0)
    all(:css, SMS_CODE_FLD)[3].set(0)
    all(:css, SMS_CODE_FLD)[4].set(0)
    all(:css, SMS_CODE_FLD)[5].set(1)
  end

  def click_logoff
    find(:dt, LOGOUT_BTN).click
  end
end