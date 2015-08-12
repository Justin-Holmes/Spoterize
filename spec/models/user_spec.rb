require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(uid: '123456', nickname: 'Jdog', token: '1111') }

  before(:each) do
    user
  end

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a uid' do
    user.uid = nil
    expect(user).to_not be_valid
  end

  it 'can find by uid' do
    u = User.find_or_create_from_oauth(stub_omniauth_user)

    expect(u.uid).to eq(user.uid)
    expect(u.nickname).to eq(user.nickname)
    expect(u.token).to eq(user.token)
  end

  it 'can create a user' do
    u = User.find_or_create_from_oauth(stub_omniauth_new_user)

    expect(u.uid).to eq('9999')
    expect(u.nickname).to eq('Jdog')
    expect(u.token).to eq('1111')
    expect(u.uid).to_not eq(user.uid)
  end

  it 'can create a user part II' do
    u = User.find_or_create_from_oauth(stub_omniauth_new_user)

    expect(u.uid).to eq('9999')
    expect(u.nickname).to eq('Jdog')
    expect(u.token).to eq('1111')
    expect(u.uid).to_not eq(user.uid)
  end

  it 'returns a pandora user' do
    good_email = { email: 'Justin12@gmail.com' }
    bad_email = { email: '98a8df9a8sdf98asdf@adf.com' }

    expect(user.pandora_user(good_email).class).to eq(Pandata::Scraper)
    expect(user.pandora_user(bad_email).class).to eq(Array)
  end
end
