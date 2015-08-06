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
    u = User.find_or_create_from_oauth(stub_omniauth)

    expect(u.uid).to eq(user.uid)
    expect(u.nickname).to eq(user.nickname)
    expect(u.token).to eq(user.token)
  end

  it 'can create a user' do
    user.uid = '123'
    u = User.find_or_create_from_oauth(stub_omniauth)

    expect(u.uid).to eq('123456')
    expect(u.nickname).to eq('Jdog')
    expect(u.token).to eq('1111')
    expect(u.uid).to_not eq(user.uid)
  end
end
