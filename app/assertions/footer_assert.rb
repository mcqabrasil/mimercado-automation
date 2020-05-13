# frozen_string_literal: true

require_relative '../page methods/footer_met'

class FooterAssertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @foo = FooterMethods.new
  end

  def assert_footer_components_visible
    content = "MiMercado\n© 2020 Derechos Reservados.\nPreguntas Frecuentes\nAviso de privacidad"

    puts "Footer div visibility: #{@foo.footer_visible?}"
    puts "Logo visibility: #{@foo.logo_visible?}"
    puts "Privacy link visibility: #{@foo.privacy_link_visible?}"
    puts "Faq link visibility: #{@foo.faq_link_visible?}"
    puts "Return Policy link visibility: #{@foo.return_policy_link_visible?}"
    puts "Terms Condictions link visibility: #{@foo.tc_link_visible?}"
    puts "Footer text displayed: #{@foo.get_content}"

    if @foo.footer_visible? &&
       @foo.privacy_link_visible? &&
       @foo.faq_link_visible? &&
       @foo.return_policy_link_visible? &&
       @foo.tc_link_visible? &&
       (@foo.get_content.include? "#{content}")
      puts 'All footer components are visible'
    else
      expect { raise 'oops' }.to raise_error('One or more content is not present')
    end
  end

  def assert_faq_url
    url = 'https://storefront-azure.mimercado.com/faq'
    expect(page).to have_current_path(url.to_s)
  end

  def assert_tc_url_path
    url = 'https://storefront-azure.mimercado.com/terms-and-conditions'
    expect(page).to have_current_path(url.to_s)
  end

  def assert_returns_policy_url_path
    url = 'https://storefront-azure.mimercado.com/return-policy'
    expect(page).to have_current_path(url.to_s)
  end

  def assert_privacy_url_path
    url = 'https://storefront-azure.mimercado.com/privacy-policy'
    expect(page).to have_current_path(url.to_s)
  end
end
