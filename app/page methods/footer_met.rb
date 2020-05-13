# Class to do the elements actions
require_relative '../pages/footer_page'

class FooterMethods < FooterPage
  include Capybara::DSL

  def footer_visible?
    has_xpath?(FOOTER_DIV)
  end
 
  def logo_visible?
    within(:xpath, '//*[@id="viewport"]/footer') do
      has_xpath?(FOOTER_LOGO)
    end
  end

  def content_visible?
    has_selector?(:dt, FOOTER_CONTENT)
  end

  def get_content
    find(:dt, FOOTER_CONTENT).text
  end

  def click_faq_link
    find(:dt, FAQ_LINK).click
  end

  def click_returns_policy_link
    find(:dt, RETURN_POLICY_LINK).click
  end

  def click_tc_link
    find(:dt, TERMS_CONDITIONS_LINK).click
  end
  
  def click_privacy_link
    find(:dt, PRIVACY_LINK).click
  end

  # Links footer visibility
  def privacy_link_visible?
    has_selector?(:dt, PRIVACY_LINK)
  end

  def faq_link_visible?
    has_selector?(:dt, FAQ_LINK)
  end

  def return_policy_link_visible?
    has_selector?(:dt, RETURN_POLICY_LINK)
  end

  def tc_link_visible?
    has_selector?(:dt, TERMS_CONDITIONS_LINK)
  end
end
