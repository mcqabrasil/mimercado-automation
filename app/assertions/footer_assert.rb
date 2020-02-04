require_relative '../page methods/footer_met'

class FooterAssertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @foo = FooterMethods.new
  end

  def assert_footer_visible
    if @foo.footer_visible?
      puts 'Footer div is present'
    else
      expect { raise "oops" }.to raise_error('Footer div is not present')
    end
  end

  def assert_logo_visible
    if @foo.logo_visible?
      puts 'Logo is present'
    else
      expect { raise "oops" }.to raise_error('Logo is not present')
    end
  end

  def assert_content_visible
    if @foo.content_visible?
      puts "Content is present: "
    else
      expect { raise "oops" }.to raise_error('Content is not present')
    end
  end

  def assert_privacy_visible
    if @foo.privacy_link_visible?
      puts 'Privacy link is present'
    else
      expect { raise "oops" }.to raise_error('Privacy is not present')
    end
  end


end