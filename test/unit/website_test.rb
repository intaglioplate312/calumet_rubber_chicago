require File.dirname(__FILE__) + '/../test_helper'

class WebsiteTest < Test::Unit::TestCase
  fixtures :websites

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Website, websites(:first)
  end
end
