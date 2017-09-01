require File.dirname(__FILE__) + '/../test_helper'
require 'website_items_controller'

# Re-raise errors caught by the controller.
class WebsiteItemsController; def rescue_action(e) raise e end; end

class WebsiteItemsControllerTest < Test::Unit::TestCase
  fixtures :website_items

  def setup
    @controller = WebsiteItemsController.new
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

    assert_not_nil assigns(:website_items)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:website_item)
    assert assigns(:website_item).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:website_item)
  end

  def test_create
    num_website_items = WebsiteItem.count

    post :create, :website_item => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_website_items + 1, WebsiteItem.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:website_item)
    assert assigns(:website_item).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil WebsiteItem.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      WebsiteItem.find(1)
    }
  end
end
