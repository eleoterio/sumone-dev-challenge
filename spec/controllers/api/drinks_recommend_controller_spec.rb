require 'rails_helper'

describe Api::DrinksRecommendController, :type => :request  do
  describe 'GET API Recommend index' do
    it "Return api Recommend Alcohol"  do
      alcohol_level = "40"
      get "/api/drinks_recommend", :params => { :alcohol_level => alcohol_level }
      json_return = JSON.parse response.body
      count = Drink.where([" alcohol_level > ? ", alcohol_level]).count()
      drinks = Drink.where([" alcohol_level > ? ", alcohol_level]).order(:name).offset(0).limit(10)

      expect(json_return['message']).to eq("List drinks")
      expect(json_return['data'][0]['name']).to eq(drinks[0]['name'])
      expect(json_return['pages']).to eq(count)
    end

    it "Return api Recommend not Alcohol "  do
      alcohol_level = "101"
      get "/api/drinks_recommend", :params => { :alcohol_level => alcohol_level }
      json_return = JSON.parse response.body

      expect(json_return['message']).to eq("level alcohol max 100")
    end

    it "Return api Recommend distilled"  do
      distilled = "true"
      get "/api/drinks_recommend", :params => { :distilled => distilled }
      json_return = JSON.parse response.body
      count = Drink.where([" distilled IN (?) ", distilled]).count();
      drinks = Drink.where([" distilled IN (?) ", distilled]).order(:name).offset(0).limit(10)

      expect(json_return['data'][0]['name']).to eq(drinks[0]['name'])
      expect(json_return['pages']).to eq(count)
    end

    it "Return api Recommend distilled different true or false"  do
      distilled = "teste"
      get "/api/drinks_recommend", :params => { :distilled => distilled }
      json_return = JSON.parse response.body

      expect(json_return['message']).to eq("Distilled can only be true or false, defined by true pattern")
    end
  end
end
