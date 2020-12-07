require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url, as: :json
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { category: @contact.category, country_id: @contact.country_id, created_by: @contact.created_by, description: @contact.description, founded: @contact.founded, header: @contact.header, id_number: @contact.id_number, image: @contact.image, kind: @contact.kind, legal_form: @contact.legal_form, name: @contact.name, surname: @contact.surname, tags: @contact.tags, trade_name_nick: @contact.trade_name_nick, updated_by: @contact.updated_by, user_id: @contact.user_id, visibility: @contact.visibility } }, as: :json
    end

    assert_response 201
  end

  test "should show contact" do
    get contact_url(@contact), as: :json
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { category: @contact.category, country_id: @contact.country_id, created_by: @contact.created_by, description: @contact.description, founded: @contact.founded, header: @contact.header, id_number: @contact.id_number, image: @contact.image, kind: @contact.kind, legal_form: @contact.legar_form, name: @contact.name, surname: @contact.surname, tags: @contact.tags, trade_name_nick: @contact.trade_name_nick, updated_by: @contact.updated_by, user_id: @contact.user_id, visibility: @contact.visibility } }, as: :json
    assert_response 200
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact), as: :json
    end

    assert_response 204
  end
end
