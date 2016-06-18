require 'test_helper'


class CanSeeAdminAsAdmin < ActionDispatch::IntegrationTest
  test "ensure that admin CAN reach admin areas" do
    Capybara.current_session.reset!
    visit "/admin/list"
    assert page.has_content?('Log in'), "Invalid content on the page!"
    fill_in('user_email', :with=> "admin@example.com")
    fill_in('user_password', :with=> "gammacookie1")
    click_button 'Log in'
    assert current_path != root_path, "redirected despite admin rights"
    assert page.has_content?('list'), "Didn't show list of admin locations"
    end

    test 'ensure that non-admin cant' do
      Capybara.current_session.reset!
      visit "/admin/list"
      assert page.has_content?('Log in'), "Invalid content on the page!"
      fill_in('user_email', :with=> "test2@example.com")
      fill_in('user_password', :with=> "gammacookie1")
      click_button 'Log in'
      assert current_path == root_path, "not moved to main page after a login without admin privileges"
    end
end
