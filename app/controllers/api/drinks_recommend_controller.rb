module Api
  class DrinksRecommendController < ApplicationController

    def index
      alcohol_level = '1'

      if params[:alcohol_level].present?
        alcohol_level = params[:alcohol_level]
      end
      where = [" alcohol_level > ? ", alcohol_level]

      if params[:distilled].present?
        where[0] += " and distilled IN (?) "
        where.push(params[:distilled])
      end

      if params[:base_ingredient].present?
        where[0] += " and base_ingredient ilike ? "
        where.push("%#{params[:base_ingredient]}%")
        where[0] += " and description ilike ? "
        where.push("%#{params[:base_ingredient]}%")
      end

      if params[:origin].present?
        where[0] += " and origin = ? "
        where.push(params[:origin])
      end

      drinks = Drink.where(where).order(:name)

      render json: {status: 'SUCCESS', message:'List drinks', data:drinks},status: :ok
    end

    private
      def drinks_params
        params.required(:search).permit(:alcohol_level, :distilled, :base_ingredient, :origin)
      end
  end
end
