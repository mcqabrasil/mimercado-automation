
# Class to get the elements content
class LoginPage
  include Capybara::DSL

  # Drop-down
  COUNTRY_DP = '.country-selector__input' # TEMPORARY

  # Options
  BRAZIL_OPT = '//*[@id="MazPhoneNumberInput"]/div[1]/div/div[3]/div/div[1]/div[3]/button' # TEMPORARY

  # Fields
  PHONE_FLD = '.input-tel__input' # TEMPORARY
  FIRST_CODE_FLD = 'code-0' # name
  SECOND_CODE_FLD = 'code-1' # name
  THIRD_CODE_FLD = 'code-2' # name
  FOURTH_CODE_FLD = 'code-3' # name
  FIFITH_CODE_FLD = 'code-4' # name
  SIXTH_CODE_FLD = 'code-5' # name

  # Buttons
  SUBMIT = 'loginSubmit'
end