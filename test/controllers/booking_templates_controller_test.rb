require 'test_helper'

class BookingTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_template = booking_templates(:one)
  end

  test "should get index" do
    get booking_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_template_url
    assert_response :success
  end

  test "should create booking_template" do
    assert_difference('BookingTemplate.count') do
      post booking_templates_url, params: { booking_template: { created_at: @booking_template.created_at, creator: @booking_template.creator, name: @booking_template.name } }
    end

    assert_redirected_to booking_template_url(BookingTemplate.last)
  end

  test "should show booking_template" do
    get booking_template_url(@booking_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_template_url(@booking_template)
    assert_response :success
  end

  test "should update booking_template" do
    patch booking_template_url(@booking_template), params: { booking_template: { created_at: @booking_template.created_at, creator: @booking_template.creator, name: @booking_template.name } }
    assert_redirected_to booking_template_url(@booking_template)
  end

  test "should destroy booking_template" do
    assert_difference('BookingTemplate.count', -1) do
      delete booking_template_url(@booking_template)
    end

    assert_redirected_to booking_templates_url
  end
end
