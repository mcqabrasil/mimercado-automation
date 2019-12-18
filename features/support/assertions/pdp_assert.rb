class PDP_Assertions 
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @pdp = PDPMethods.new
  end

  def assert_cart_notification_msg(text)
    if @pdp.get_cart_notification_msg == text
      puts "The notification #{text} was displayed"
    else
      expect { raise "oops" }.to raise_error('Notification was not displayed')
    end
    puts "given notification: #{text}"
    puts "element text: #{@pdp.get_cart_notification_msg}"
  end

  def assert_notification_is_closed
    if @pdp.notification_visible?
      expect { raise "oops" }.to raise_error('Notification was not closed')
    else
      puts 'Notification closed'
    end
  end

  def assert_be_on_pdp
    # to be verified with development
  end

  def assert_url_ison_checkout_page
    expect(page).to have_current_path("http://front.mimercado.ztech.net/checkout")
  end
end
