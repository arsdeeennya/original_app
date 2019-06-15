# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', 'https://twitter.com/joyato4'
    assert_select 'a[href=?]', 'https://github.com/arsdeeennya/twitask' 
    assert_select 'a[href=?]', 'https://www.wantedly.com/users/101668387'
  end
end
