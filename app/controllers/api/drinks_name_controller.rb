module Api
  class DrinksNameController < ApplicationController

    def index
      init_pages = 0;
      if params[:pages].present?
        init_pages = (params[:pages].to_i * 10) - 10;
      end
      count = Drink.where([" name ilike ? ", "%#{params[:name]}%"]).count();
      drinks = Drink.where([" name ilike ? ", "%#{params[:name]}%"]).order(:name).offset(init_pages).limit(10)
      render json: {status: 'SUCCESS', message:'List drinks', data:drinks, pages: count},status: :ok
    end

    private
      def drinks_params
        params.required(:search).permit(:name, :pages)
      end
  end
end
