require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'is valid with a name, email, password, password_confirmation' do
    user = User.new(
      name:'hogehoge',
      email: 'hogehoge@yahoo.co.jp',
      password: 'foobar',
      password_confirmation: 'foobar')
      
    expect(user).to be_valid
  end  
  
  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  
  it 'is invalid without a email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  
  it 'is invalid with a duplicate email address' do
    User.create(
      name: 'hogehoge',
      email: 'hogehoge@yahoo.co.jp',
      password: 'foobar',
      password_confirmation: 'foobar')
      
    user = User.new(
      name: 'hogetaro',
      email: 'hogehoge@yahoo.co.jp',
      password: 'hogetaro',
      password_confirmation: 'hogetaro')
      
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  # # 重複したメールアドレスなら無効な状態であること
  # it "is invalid with a duplicate email address"
  # # ユーザーのフルネームを文字列として返すこと
  # it "returns a user's full name as a string"
end