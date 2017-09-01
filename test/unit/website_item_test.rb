require File.dirname(__FILE__) + '/../test_helper'

class WebsiteItemTest < Test::Unit::TestCase
  fixtures :website_items

  # Replace this with your real tests.
  def test_truth
    assert_kind_of WebsiteItem, website_items(:first)
  end
end
