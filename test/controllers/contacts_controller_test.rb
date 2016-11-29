require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { description_en: @contact.description_en, description_ru: @contact.description_ru, email: @contact.email, name_en: @contact.name_en, name_ru: @contact.name_ru, phone: @contact.phone, row_num: @contact.row_num }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { description_en: @contact.description_en, description_ru: @contact.description_ru, email: @contact.email, name_en: @contact.name_en, name_ru: @contact.name_ru, phone: @contact.phone, row_num: @contact.row_num }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
