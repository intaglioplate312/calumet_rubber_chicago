require File.dirname(__FILE__) + '/../test_helper'

class OrganizationCategoryTest < Test::Unit::TestCase
  fixtures :organization_categories

  # Replace this with your real tests.
  def test_truth
    assert_kind_of OrganizationCategory, organization_categories(:first)
  end
end
