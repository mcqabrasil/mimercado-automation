# Class to get the elements content
class FooterPage
  include Capybara::DSL

  # DIV
  FOOTER_DIV = '//*[@id="viewport"]/footer'

  # OTHERS
  FOOTER_LOGO = '//*[@id="viewport"]/footer/div[1]/svg'
  FOOTER_CONTENT = 'bottomLinks'

  # LINKS
  PRIVACITY_LINK = '//*[@id="viewport"]/footer/div[1]/ul/li[3]/a' # PROVISORIO
  FAQ_LINK = 'faqLink'


end