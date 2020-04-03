# frozen_string_literal: true

require_relative '../page methods/footer_met'

class FooterAssertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @foo = FooterMethods.new
  end

  def assert_content_visible
    content = "MiMercado\n© 2020 Derechos Reservados.\nPreguntas Frecuentes\nAviso de privacidad"
    if @foo.footer_visible?
      expect(@foo.get_content).to include(content)
    else
      expect { raise 'oops' }.to raise_error('One or more content is not present')
    end
    puts @foo.get_content.to_s
  end

  def assert_logo_visible
    if @foo.logo_visible?
      puts 'Logo is present'
    else
      expect { raise 'oops' }.to raise_error('Logo is not present')
    end
  end

  def assert_privacy_visible
    if @foo.privacy_link_visible?
      puts 'Privacy link is present'
    else
      expect { raise 'oops' }.to raise_error('Privacy is not present')
    end
  end

  def assert_faq_url
    url = "https://storefront-qa.mimercado.com/faq"
    expect(page).to have_current_path("#{url}")
  end
  
  def assert_tc_url_path
    url = "https://storefront-qa.mimercado.com/terms-and-conditions"
    expect(page).to have_current_path("#{url}")
  end

  def assert_returns_policy_url_path
    url = "https://storefront-qa.mimercado.com/return-policy"
    expect(page).to have_current_path("#{url}")
  end

  def assert_privacy_url_path
    url = "https://storefront-qa.mimercado.com/privacy-policy"
    expect(page).to have_current_path("#{url}")
  end
  
end
