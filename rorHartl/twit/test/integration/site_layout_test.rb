require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  #to check that integratio test passes, run: bundle exec rake test:integration
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path #automatically checks for <a href="/about">..</a>
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
