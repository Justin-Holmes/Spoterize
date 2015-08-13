require 'rails_helper'

describe 'user can search pandora songs', type: :feature do
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
    fill_in :email, with: "jorge.pandora123@gmail.com"
    click_on "Submit"

    assert_equal "/playlist/new", current_path
    assert page.has_content?("Name Your Playlist")
    assert page.has_content?("Justin Bieber")
  end

  it 'user gets a flash message with an incorrect pandora email' do
    visit root_path
    assert_equal 200, page.status_code
    click_on "Login to Spotify"
    fill_in :email, with: "asdf"
    click_on "Submit"

    assert page.has_content?("Enter a Pandora Email")
    assert page.has_content?("Please enter a valid Pandora email")
    assert_equal "/pandora", current_path
  end
end
