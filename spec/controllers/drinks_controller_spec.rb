require 'rails_helper'

describe DrinksController do
  describe 'GET index' do
    subject { drink }

    let(:drink) { FactoryBot.build :drink }
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
