require 'test_helper'

class ContactMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_method = contact_methods(:one)
  end

  test "should get index" do
    get contact_methods_url, as: :json
    assert_response :success
  end

  test "should create contact_method" do
    assert_difference('ContactMethod.count') do
      post contact_methods_url, params: { contact_method: { contact_id: @contact_method.contact_id, created_by: @contact_method.created_by, data: @contact_method.data, kind: @contact_method.kind, notes: @contact_method.notes, updated_by: @contact_method.updated_by, visibility: @contact_method.visibility } }, as: :json
    end

    assert_response 201
  end

  test "should show contact_method" do
    get contact_method_url(@contact_method), as: :json
    assert_response :success
  end

  test "should update contact_method" do
    patch contact_method_url(@contact_method), params: { contact_method: { contact_id: @contact_method.contact_id, created_by: @contact_method.created_by, data: @contact_method.data, kind: @contact_method.kind, notes: @contact_method.notes, updated_by: @contact_method.updated_by, visibility: @contact_method.visibility } }, as: :json
    assert_response 200
  end

  test "should destroy contact_method" do
    assert_difference('ContactMethod.count', -1) do
      delete contact_method_url(@contact_method), as: :json
    end

    assert_response 204
  end
end
