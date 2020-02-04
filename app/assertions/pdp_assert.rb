require_relative '../page methods/pdp_met'

class PDPAssertions 
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @pdp = PDPMethods.new
  end

  def assert_cart_notification_msg(text)
    if @pdp.get_cart_notification_msg == text
      puts 'The notification was displayed'
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

  def assert_quantity_error_message(content)
    if @pdp.error_message_visible?(content)
      puts 'Error message was displayed'
    else
      expect { raise "oops" }.to raise_error('Error message was not displayed or is incorrect')
    end
    puts "Error message content displayed: #{@pdp.error_message_visible?(content)}"
  end

  def assert_add_to_cart_btn_disabled
    if @pdp.add_to_cart_btn_enabled?
      expect { raise "oops" }.to raise_error('Add to Cart button was not disabled')
    else
      puts 'Add to Cart button was disabled'
    end
  end

  def assert_url_pdp(url)
    expect(page).to have_current_path("#{url}")
  end

end