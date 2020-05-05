require "test_helper"

class HebcalTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Hebcal::VERSION
  end

  def test_it_returns_my_birthday
    date = Date.new(1963,6,10)
    retval = Hebcal.g2d(date)

    assert_equal '10 June 1963 (18 Sivan 5723)', retval
  end
end
