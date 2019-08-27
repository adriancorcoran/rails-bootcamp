require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest

  test "should get hello" do  
    get dashboards_hello_url
    assert_response :success
  end

  test "should get hi" do  
    get dashboards_hi_url
    assert_response :success
  end

  test "should get personalized message" do
    get dashboards_personalized_url(name: "Reeba")
    assert_response :success
    assert_select 'body #message', 'Hello, Reeba'
  end

  test "should get personalised message" do
    get dashboards_personalised_url(name: "Reeba")
    assert_response :success
    assert_select 'body #message', 'Hello, Reeba'
  end

  test "should get reverse-personalized message" do
    get dashboards_reversed_url(name: "Reeba")
    assert_response :success
    assert_select 'body #message', 'Hello, abeeR'
  end

end