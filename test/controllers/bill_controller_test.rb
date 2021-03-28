# frozen_string_literal: true

require 'test_helper'

class BillControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get bill_show_url
    assert_response :success
  end
end
