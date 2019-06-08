module Api
  class DrinksNameController < ApplicationController

    def index
      drinks = Drink.where([" name ilike ? ", "%#{params[:name]}%"]).order(:name)
      render json: {status: 'SUCCESS', message:'List drinks', data:drinks},status: :ok
    end

    private
      def drinks_params
        params.required(:search).permit(:name)
      end
  end
end
