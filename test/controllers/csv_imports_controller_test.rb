require 'test_helper'

class CsvImportsControllerTest < ActionController::TestCase
  setup do
    @csv_import = csv_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csv_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csv_import" do
    assert_difference('CsvImport.count') do
      post :create, csv_import: { data: @csv_import.data }
    end

    assert_redirected_to csv_import_path(assigns(:csv_import))
  end

  test "should show csv_import" do
    get :show, id: @csv_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csv_import
    assert_response :success
  end

  test "should update csv_import" do
    patch :update, id: @csv_import, csv_import: { data: @csv_import.data }
    assert_redirected_to csv_import_path(assigns(:csv_import))
  end

  test "should destroy csv_import" do
    assert_difference('CsvImport.count', -1) do
      delete :destroy, id: @csv_import
    end

    assert_redirected_to csv_imports_path
  end
end
