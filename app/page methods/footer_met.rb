# Class to do the elements actions
require_relative '../pages/footer_page'

class FooterMethods < FooterPage
  include Capybara::DSL

  def footer_visible?
    page.execute_script "window.scrollBy(0,10000)"
    has_xpath?(FOOTER_DIV)
  end

  def logo_visible?
    page.execute_script "window.scrollBy(0,10000)"
    has_xpath?(FOOTER_LOGO)
  end

  def content_visible?
    page.execute_script "window.scrollBy(0,10000)"
    has_selector?(:dt, FOOTER_CONTENT)
  end

  def get_content
    page.execute_script "window.scrollBy(0,10000)"
    find(:dt, FOOTER_CONTENT).text
  end

  def privacy_link_visible?
    page.execute_script "window.scrollBy(0,10000)"
    has_selector?(:dt, PRIVACITY_LINK)
  end
end
