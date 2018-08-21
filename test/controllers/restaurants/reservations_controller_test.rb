require 'test_helper'

class Restaurants::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurants_reservations_index_url
    assert_response :success
  end

end
