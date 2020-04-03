# frozen_string_literal: true

# Class to get the elements content
class FooterPage
  include Capybara::DSL

  # DIV
  FOOTER_DIV = '//*[@id="viewport"]/footer'

  # OTHERS
  FOOTER_LOGO = '//*[@id="viewport"]/footer/div[1]/svg'
  FOOTER_CONTENT = 'bottomLinks'

  # LINKS
  RETURN_POLICY_LINK = 'retPolicyLink'
  TERMS_CONDITIONS_LINK = 'tcLink'
  PRIVACY_LINK = 'privacyLink'
  FAQ_LINK = 'faqLink'
end
