require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe 'ログイン機能' do
    
    before do
      FactoryBot.create(:user)
    end
    
    context 'ログインできない' do
      
      before do
      visit login_path
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      click_button 'ログイン'
      end
      
      it 'test' do
        expect(page).to have_content 'ログイン'
      end
    end
  end
end