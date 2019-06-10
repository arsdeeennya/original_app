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
  
  describe 'ログイン機能' do
    
    context 'ログインできる場合' do
      
      it '名前、メール、パスワード、パスワード（確認）があれば有効である' do
        expect(FactoryBot.build(:user)).to be_valid
      end
      
      it 'メールアドレス（フォーマット内）は有効である' do
        valid_addresses = %w[user1@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
          user = FactoryBot.build(:user, email: valid_address)
          expect(user).to be_valid 
        end
      end
    
    end  
    
    context 'ログインできない場合' do
      
      it '名前は空だと、ななしのごんべい、になる' do
        user = FactoryBot.build(:user, name: nil )
        user.valid?
        expect(user.name).to include("ななしのごんべい")
      end
      
      it '名前は長すぎると無効である' do
        user = FactoryBot.build(:user, name: 'a' * 51)
        user.valid?
        expect(user.errors[:name]).to include('は50文字以内で入力してください') 
      end
      
      it 'メールアドレスはnilだと無効である' do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('は不正な値です')
      end
      
      it 'メールアドレスは長すぎては無効である' do
        user = FactoryBot.build(:user, email: 'a' * 244 + '@example.com')
        user.valid?
        expect(user.errors[:email]).to include('は255文字以内で入力してください')
      end
      
      
      it 'メールアドレス（フォーマット外）は無効である' do
        valid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
        valid_addresses.each do |valid_address|
          user = FactoryBot.build(:user, email: valid_address)
          user.valid?
          expect(user.errors[:email]).to include('は不正な値です')
        end
      end
      
      it 'メールアドレスは一意である' do
        duplicate_user = FactoryBot.create(:user).dup
        duplicate_user.valid?
        expect(duplicate_user.errors[:email]).to include('はすでに存在します')
      end
      
      it 'パスワードは入力必須である' do
        user = FactoryBot.build(:user, password: ' ' * 6, password_confirmation: ' ' * 6)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end
    
      it 'パスワードは短すぎると無効である' do
        user = FactoryBot.build(:user, password: 'a' * 5, password_confirmation: 'a' * 5)
        user.valid?
        expect(user.errors[:password]).to include('は6文字以上で入力してください')
      end
      
    end
  end
end
