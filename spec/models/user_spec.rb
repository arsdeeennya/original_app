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

  it '名前、メール、パスワード、パスワード（確認）があれば有効である' do
    expect(@user).to be_valid
  end

  it '名前が空だと、ななしのごんべい、になる' do
    @user = User.new(name: nil)
    @user.valid?
    expect(@user.name).to include("ななしのごんべい")
  end

  it 'メールアドレスがなければ入力必須である' do
    @user = User.new(email: nil)
    @user.valid?
    expect(@user.errors[:email]).to include('は不正な値です')
  end
  
  it '名前は長すぎると無効である' do
    @user.name = 'a' * 51
    @user.valid?
    expect(@user.errors[:name]).to include('は50文字以内で入力してください') 
  end
  
  it 'メールアドレスは長すぎては無効である' do
    @user.email = 'a' * 244 + '@example.com'
    @user.valid?
    expect(@user.errors[:email]).to include('は255文字以内で入力してください')
  end
  
  it '有効なメールアドレスは有効である' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      @user.valid?
      expect(@user.errors[:email]).to_not include('は不正な値です')
    end
  end
  
  it '無効なメールアドレスを無効である' do
    valid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                        foo@bar_baz.com foo@bar+baz.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      @user.valid?
      expect(@user.errors[:email]).to include('は不正な値です')
    end
  end
  
  it 'メールアドレスは一意である' do
    duplicate_user = @user.dup
    duplicate_user.valid?
    expect(duplicate_user.errors[:email]).to include('はすでに存在します')
  end

  it 'パスワードは入力必須である' do
    @user.password = @user.password_confirmation = ' ' * 6
    @user.valid?
    expect(@user.errors[:password]).to include('を入力してください')
  end

  it 'パスワードは短すぎてはいけない' do
    @user.password = @user.password_confirmation = 'a' * 5
    @user.valid?
    expect(@user.errors[:password]).to include('は6文字以上で入力してください')
  end
  
end
