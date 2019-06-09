require 'rails_helper'

describe DrinksHelper do
  describe 'Validations Helper' do
    subject { drink }

    let(:drink) { FactoryBot.build :drink }
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
