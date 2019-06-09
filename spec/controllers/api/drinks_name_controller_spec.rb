require 'rails_helper'

describe Api::DrinksNameController do
  describe 'GET API Name index' do
    subject { drink }

    let(:drink) { FactoryBot.build :drink }
    it "get index api drink nmae" do
      get :index
      expect(response.status).to eq(200)
      expect(response.message).to eq("OK")
    end
  end
end
