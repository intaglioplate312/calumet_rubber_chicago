require File.dirname(__FILE__) + '/../test_helper'

class AssociateTypeTest < Test::Unit::TestCase
  fixtures :associate_types

  # Replace this with your real tests.
  def test_truth
    assert_kind_of AssociateType, associate_types(:first)
  end
end
