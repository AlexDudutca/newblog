require 'test_helper'

class GiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    gifts = [
        {name: 'Microwave'},
        {name: 'Toster'},
        {name: 'Tv'},
        {name: 'Refrigerator'},
    ]
    get '/gifts'
    request_gifts = JSON.parse(response.body)
    assert_equal(
        gifts.to_json,
        request_gifts['gifts'].map { |el| {name: el['name']} }.to_json)
    assert_response :success

  end

  test "should create" do
    post '/gifts', params: {gifts: {name: 'iPad'}}
    assert_response :success
    assert_equal(Gift.last.name, 'iPad')
  end

  test "should get error" do
    post '/gifts', params: {gifts: {name: ''}}
    assert_response :bad_request
    assert_equal(response.body, '{"message":["Name can\'t be blank"]}')
  end
end



