require File.dirname(__FILE__) + '/../test_helper'

class OrganizationTest < Test::Unit::TestCase
  fixtures :organizations

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Organization, organizations(:first)
  end
end
