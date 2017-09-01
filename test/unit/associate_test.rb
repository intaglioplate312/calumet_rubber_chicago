require File.dirname(__FILE__) + '/../test_helper'

class AssociateTest < Test::Unit::TestCase
  fixtures :associates

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Associate, associates(:first)
  end
end
