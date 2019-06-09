module DrinksHelper

  def self.base_ingredient
    Drink.select(:base_ingredient).group(:base_ingredient).order(:base_ingredient)
  end

  def self.origin
    Drink.select(:origin).group(:origin).order(:origin)
  end

  def self.format_pages(pages)
    if pages.to_i < 0
      return 0;
    end
    itit_pages = 0
    if pages.present?
      init_pages = (pages.to_i * 10) - 10;
    end
  end

end
