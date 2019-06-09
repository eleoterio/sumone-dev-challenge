module Api
  class DrinksRecommendController < ApplicationController

    def index
      init_pages = DrinksHelper.format_pages(params[:pages]);
      where = set_where
      message = set_message

      count = Drink.where(where).count();
      drinks = Drink.where(where).order(:name).offset(init_pages).limit(10)

      render json: {status: 'SUCCESS', message: message, data: drinks, pages: count},status: :ok
    end

    def set_message
      message = 'List drinks'
      if params[:alcohol_level].present? && params[:alcohol_level].to_i > 100
        message = "level alcohol max 100"
      end

      if params[:distilled].present? && !['true', 'false'].include?(params[:distilled])
        message = "Distilled can only be true or false, defined by true pattern"
      end
      message
    end

    def set_where
      alcohol_level = '1'

      if params[:alcohol_level].present? && params[:alcohol_level].to_i < 100
        alcohol_level = params[:alcohol_level]
      elsif params[:alcohol_level].present? && params[:alcohol_level].to_i > 100
        alcohol_level = 100
      end
      where = [" alcohol_level > ? ", alcohol_level]

      if params[:distilled].present? && ['true', 'false'].include?(params[:distilled])
        where[0] += " and distilled IN (?) "
        where.push(params[:distilled])
      elsif params[:distilled].present? && !['true', 'false'].include?(params[:distilled])
        where[0] += " and distilled IN (?) "
        where.push("true")
      end

      if params[:base_ingredient].present?
        where[0] += " and base_ingredient ilike ? "
        where.push("%#{params[:base_ingredient]}%")
        where[0] += " or description ilike ? "
        where.push("%#{params[:base_ingredient]}%")
      end

      if params[:origin].present?
        where[0] += " and origin = ? "
        where.push(params[:origin])
      end
      where
    end

    private
      def drinks_params
        params.required(:search).permit(:alcohol_level, :distilled, :base_ingredient, :origin)
      end
  end
end
