require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "期待されたステータスコードが返る" do
    
    it "ステータスコードが200である" do
      get :home
      expect(response).to be_success
    end
    
    it "ステータスコードが200である" do
      get :help
      expect(response).to be_success
    end
    
    it "ステータスコードが200である" do
      get :about
      expect(response).to be_success
    end
    
    it "ステータスコードが200である" do
      get :contact
      expect(response).to be_success
    end
    
  end
end
