require 'rails_helper'

describe DrinksHelper do
  describe 'Validations Helper' do

    it "method base_ingredient" do
      base_db = Drink.select(:base_ingredient).group(:base_ingredient).order(:base_ingredient)
      base_helper = DrinksHelper.base_ingredient
      expect(base_helper).to eq(base_db)
    end

    it "method origin" do
      origin_db = Drink.select(:origin).group(:origin).order(:origin)
      origin_helper = DrinksHelper.origin
      expect(origin_helper).to eq(origin_db)
    end

    it "method format_pages 0" do
      pages = DrinksHelper.format_pages(1)
      expect(pages).to eq(0)
    end

    it "method format_pages 5" do
      pages = DrinksHelper.format_pages(5)
      expect(pages).to eq(40)
    end

    it "method format_pages negative" do
      pages = DrinksHelper.format_pages(-5)
      expect(pages).to eq(0)
    end
  end
end
