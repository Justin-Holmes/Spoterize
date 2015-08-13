require 'rails_helper'

describe 'user can log out', type: :feature do
  include Capybara::DSL

  let(:user) { User.create(uid: '123456', token: '1111') }

  before(:each) do
    Capybara.app = Spoterize::Application
    stub_omniauth_user
    user
  end

  it 'user can login to Spotify' do
    visit root_path
    assert_equal 200, page.status_code
    click_on "Login to Spotify"
    click_on "Logout"

    assert_equal root_path, current_path
    assert page.has_content?("Login to Spotify")
  end
end
