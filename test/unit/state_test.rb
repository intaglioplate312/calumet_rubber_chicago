require File.dirname(__FILE__) + '/../test_helper'

class StateTest < Test::Unit::TestCase
  fixtures :states

  # Replace this with your real tests.
  def test_truth
    assert_kind_of State, states(:first)
  end
end
