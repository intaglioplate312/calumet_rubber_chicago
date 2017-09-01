require File.dirname(__FILE__) + '/../test_helper'
require 'security_roles_controller'

# Re-raise errors caught by the controller.
class SecurityRolesController; def rescue_action(e) raise e end; end

class SecurityRolesControllerTest < Test::Unit::TestCase
  fixtures :security_roles

  def setup
    @controller = SecurityRolesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:security_roles)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:security_role)
    assert assigns(:security_role).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:security_role)
  end

  def test_create
    num_security_roles = SecurityRole.count

    post :create, :security_role => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_security_roles + 1, SecurityRole.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:security_role)
    assert assigns(:security_role).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil SecurityRole.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      SecurityRole.find(1)
    }
  end
end
