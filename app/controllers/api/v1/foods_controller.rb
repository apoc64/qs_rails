class Api::V1::FoodsController < ApplicationController

  def index
    foods = Food.all
    render json: foods
  end

  def create
    Food.create(food_params)
  end

  def show
    food = Food.find(params[:id])
    render json: food
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
