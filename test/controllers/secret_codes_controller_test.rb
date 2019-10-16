require 'test_helper'

class SecretCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @secret_code = secret_codes(:one)
  end

  test "should get index" do
    get secret_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_secret_code_url
    assert_response :success
  end

  test "should create secret_code" do
    assert_difference('SecretCode.count') do
      post secret_codes_url, params: { secret_code: { token: @secret_code.token, user_id: @secret_code.user_id } }
    end

    assert_redirected_to secret_code_url(SecretCode.last)
  end

  test "should show secret_code" do
    get secret_code_url(@secret_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_secret_code_url(@secret_code)
    assert_response :success
  end

  test "should update secret_code" do
    patch secret_code_url(@secret_code), params: { secret_code: { token: @secret_code.token, user_id: @secret_code.user_id } }
    assert_redirected_to secret_code_url(@secret_code)
  end

  test "should destroy secret_code" do
    assert_difference('SecretCode.count', -1) do
      delete secret_code_url(@secret_code)
    end

    assert_redirected_to secret_codes_url
  end
end
