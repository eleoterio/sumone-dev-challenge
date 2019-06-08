class DrinksController < ApplicationController
  def index
    @drinks = Drink.all.order(:name).limit(10)
    @count = Drink.count()
    @origins = DrinksHelper.origin
    @base_ingredients = DrinksHelper.base_ingredient
  end
end
