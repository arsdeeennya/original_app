# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      name: 'Example User',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  end

  # 名、メール、パスワード、パスワード（確認）があれば有効である
  it 'is valid with a name, email, password, password_confirmation' do
    expect(@user).to be_valid
  end

  # 名前が空だと”ななしのごんべい”になる
  it 'is valid without a name' do
    @user = User.new(name: nil)
    @user.valid?
    expect(@user.name).to include("ななしのごんべい")
  end

  # メールアドレスがなければ無効である
  it 'is invalid without a email' do
    @user = User.new(email: nil)
    @user.valid?
    expect(@user.errors[:email]).to include('は不正な値です')
  end

  # メールアドレスが重複したら無効である
  it 'is invalid with a duplicate email address' do
    user = User.new(
      name: 'Example User',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    )

    user.valid?
    expect(user.errors[:email]).to include('はすでに存在します')
  end
end
