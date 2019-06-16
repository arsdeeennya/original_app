require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "期待されたステータスコードが返る" do
    
    it "ステータスコードが200である" do
      get :new
      expect(response).to be_success
    end
    
  end
end
  