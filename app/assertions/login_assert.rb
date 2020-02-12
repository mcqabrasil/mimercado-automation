require_relative '../page methods/login_met'

class LoginAssertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @login = LoginMethods.new
  end


end