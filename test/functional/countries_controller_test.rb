require File.dirname(__FILE__) + '/../test_helper'
require 'countries_controller'

# Re-raise errors caught by the controller.
class CountriesController; def rescue_action(e) raise e end; end

class CountriesControllerTest < Test::Unit::TestCase
  fixtures :countries

  def setup
    @controller = CountriesController.new
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

    assert_not_nil assigns(:countries)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:country)
    assert assigns(:country).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:country)
  end

  def test_create
    num_countries = Country.count

    post :create, :country => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_countries + 1, Country.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:country)
    assert assigns(:country).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Country.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Country.find(1)
    }
  end
end
