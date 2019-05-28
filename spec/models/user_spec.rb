require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = User.create(
      name: "Example User", 
      email: "user@example.com",
      password: "foobar",
      password_confirmation: "foobar")
  end
  
  
  # 名、メール、パスワード、パスワード（確認）があれば有効である
  it 'is valid with a name, email, password, password_confirmation' do
    expect(@user).to be_valid
  end  
  
  #名前がなくても有効である
  it 'is valid without a name' do
    @user = User.new(name: nil)
    @user.valid?
    expect(@user.errors[:name]).to_not include("can't be blank")
  end
  
  # メールアドレスがなければ無効である
  it 'is invalid without a email' do
    @user = User.new(email: nil)
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end
  
  # メールアドレスが重複したら無効である
  it 'is invalid with a duplicate email address' do
    user = User.new(
      name: 'Example User',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar')
      
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end