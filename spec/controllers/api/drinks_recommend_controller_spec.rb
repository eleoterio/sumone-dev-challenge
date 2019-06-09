require 'rails_helper'

describe Api::DrinksRecommendController do
  describe 'GET API Recommend index' do

    let(:drink) { FactoryBot.build :drink }
    it "get index api drink Recommend" do
      get :index
      expect(response.status).to eq(200)
      expect(response.message).to eq("OK")
    end
  end
end
