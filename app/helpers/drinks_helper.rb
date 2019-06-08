module DrinksHelper

  def self.base_ingredient
    Drink.select(:base_ingredient).group(:base_ingredient).order(:base_ingredient)
  end

  def self.origin
    Drink.select(:origin).group(:origin).order(:origin)
  end

end
