require "test_helper"

class RafsonTest < ActiveSupport::TestCase
  test "the truth" do
    Rafson.create(number: 64, array: "")
    flag = Rafson.new(number: 64, array: "")
    assert_equal flag.save(), false
  end
end

