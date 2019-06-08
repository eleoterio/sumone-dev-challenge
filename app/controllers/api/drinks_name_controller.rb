module Api
  class DrinksNameController < ApplicationController

    def index
      init_pages = DrinksHelper.format_pages(params[:pages]);
      
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
