require 'rails_helper'

describe Api::DrinksNameController, :type => :request do
  describe 'GET API Name index' do

    it "Return api Message, status, pages"  do
      name_test = "coffe"
      get "/api/drinks_name", :params => { :name => name_test }
      json_return = JSON.parse response.body
      count = Drink.where([" name ilike ? ", "%#{name_test}%"]).count();
      drinks = Drink.where([" name ilike ? ", "%#{name_test}%"]).order(:name).offset(0).limit(10)

      expect(json_return['message']).to eq("List drinks")
      expect(json_return['status']).to eq("SUCCESS")
      expect(json_return['data'][0]['name']).to eq(drinks[0]['name'])
      expect(json_return['pages']).to eq(count)
    end

    it "Return api no return  Message, status, pages"  do
      name_test = "teste"
      get "/api/drinks_name", :params => { :name => name_test }
      json_return = JSON.parse response.body

      expect(json_return['data']).to eq([])
      expect(json_return['pages']).to eq(0)
    end

  end
end
