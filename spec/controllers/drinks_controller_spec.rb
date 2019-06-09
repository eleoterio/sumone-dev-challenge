require 'rails_helper'

describe DrinksController do
  describe 'GET index' do

    it "assigns @drinks" do
      drinks = Drink.all.order(:name).limit(10)
      get :index
      expect(assigns(:drinks)).to eq(drinks)
    end

    it "assigns @qtd_pages" do
      count = Drink.count()
      qtd_pages = count / 10
      get :index
      expect(assigns(:qtd_pages)).to eq(qtd_pages)
    end

    it "assigns @origins" do
      origins = DrinksHelper.origin
      get :index
      expect(assigns(:origins)).to eq(origins)
    end

    it "assigns @base_ingredients" do
      base_ingredients = DrinksHelper.base_ingredient
      get :index
      expect(assigns(:base_ingredients)).to eq(base_ingredients)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
