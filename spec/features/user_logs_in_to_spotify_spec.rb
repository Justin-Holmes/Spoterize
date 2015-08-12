require 'rails_helper'

describe 'user can log in', type: :feature do
  include Capybara::DSL

  let(:user) { User.create(uid: '123456', nickname: 'Jdog', token: '1111') }

  before(:each) do
    Capybara.app = Spoterize::Application
    stub_omniauth_user
    user
  end

  it 'user can login to Spotify' do
    visit root_path
    assert_equal 200, page.status_code
    click_on "Login to Spotify"
    assert_equal '/pandora', current_path
    assert page.has_content?("Jdog")
    assert page.has_content?("Enter a Pandora Email")
  end
end
