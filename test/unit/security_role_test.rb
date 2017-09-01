require File.dirname(__FILE__) + '/../test_helper'

class SecurityRoleTest < Test::Unit::TestCase
  fixtures :security_roles

  # Replace this with your real tests.
  def test_truth
    assert_kind_of SecurityRole, security_roles(:first)
  end
end
