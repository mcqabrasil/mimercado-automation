class Test_Assertions 
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @test_met = TestMethods.new
  end 

  def assert_something
    # code
  end
end