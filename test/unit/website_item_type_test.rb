require File.dirname(__FILE__) + '/../test_helper'

class WebsiteItemTypeTest < Test::Unit::TestCase
  fixtures :website_item_types

  # Replace this with your real tests.
  def test_truth
    assert_kind_of WebsiteItemType, website_item_types(:first)
  end
end
