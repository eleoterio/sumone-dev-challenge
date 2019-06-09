class DrinksController < ApplicationController
  def index
    count = Drink.count()

    @drinks = Drink.all.order(:name).limit(10)
    @qtd_pages = count / 10
    @origins = DrinksHelper.origin
    @base_ingredients = DrinksHelper.base_ingredient
    if @qtd_pages.to_i < 0
      @qtd_pages = 0;
    end
  end
end
