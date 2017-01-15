require 'test_helper'

class BookingTemplateItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_template_item = booking_template_items(:one)
  end

  test "should get index" do
    get booking_template_items_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_template_item_url
    assert_response :success
  end

  test "should create booking_template_item" do
    assert_difference('BookingTemplateItem.count') do
      post booking_template_items_url, params: { booking_template_item: { activity: @booking_template_item.activity, booking_template_id: @booking_template_item.booking_template_id, comment: @booking_template_item.comment, date_str: @booking_template_item.date_str, from: @booking_template_item.from, note: @booking_template_item.note, team: @booking_template_item.team, to: @booking_template_item.to, week: @booking_template_item.week, zamboni: @booking_template_item.zamboni } }
    end

    assert_redirected_to booking_template_item_url(BookingTemplateItem.last)
  end

  test "should show booking_template_item" do
    get booking_template_item_url(@booking_template_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_template_item_url(@booking_template_item)
    assert_response :success
  end

  test "should update booking_template_item" do
    patch booking_template_item_url(@booking_template_item), params: { booking_template_item: { activity: @booking_template_item.activity, booking_template_id: @booking_template_item.booking_template_id, comment: @booking_template_item.comment, date_str: @booking_template_item.date_str, from: @booking_template_item.from, note: @booking_template_item.note, team: @booking_template_item.team, to: @booking_template_item.to, week: @booking_template_item.week, zamboni: @booking_template_item.zamboni } }
    assert_redirected_to booking_template_item_url(@booking_template_item)
  end

  test "should destroy booking_template_item" do
    assert_difference('BookingTemplateItem.count', -1) do
      delete booking_template_item_url(@booking_template_item)
    end

    assert_redirected_to booking_template_items_url
  end
end
