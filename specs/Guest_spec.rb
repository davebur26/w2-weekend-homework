require('minitest/autorun')
require_relative('../Guest.rb')
require('minitest/rg')

class GuestTest < MiniTest::Test

  def test_name
    guest1 = Guest.new("David")
    assert_equal("David", guest1.name)
  end

end
