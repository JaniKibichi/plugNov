require 'test_helper'

class BigqueriesControllerTest < ActionController::TestCase
  setup do
    @bigquery = bigqueries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bigqueries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bigquery" do
    assert_difference('Bigquery.count') do
      post :create, bigquery: { number: @bigquery.number, text: @bigquery.text }
    end

    assert_redirected_to bigquery_path(assigns(:bigquery))
  end

  test "should show bigquery" do
    get :show, id: @bigquery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bigquery
    assert_response :success
  end

  test "should update bigquery" do
    patch :update, id: @bigquery, bigquery: { number: @bigquery.number, text: @bigquery.text }
    assert_redirected_to bigquery_path(assigns(:bigquery))
  end

  test "should destroy bigquery" do
    assert_difference('Bigquery.count', -1) do
      delete :destroy, id: @bigquery
    end

    assert_redirected_to bigqueries_path
  end
end
