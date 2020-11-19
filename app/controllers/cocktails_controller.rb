class CocktailsController < ApplicationController
  before_action :find_by_param, only: %i[show]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.valid?
      @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show() end

  def index
    @cocktails = Cocktail.all
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient, :dose)
  end

  def find_by_param
    @cocktail = Cocktail.find(params[:id])
  end
end
