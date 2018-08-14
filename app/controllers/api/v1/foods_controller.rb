class Api::V1::FoodsController < ApplicationController

  def index
    foods = Food.all
    render json: foods
  end

  def create
    Food.create(food_params)
  end

  def show
    if Food.exists?(params[:id])
      food = Food.find(params[:id])
      render json: food
    else
      render json: {"message" => "Bad request"}, status: 404
    end
  end

  def update
    if Food.exists?(params[:id])
      food = Food.find(params[:id])
      food.update(food_params)
    else
      render json: {"message" => "Bad request"}, status: 404
    end
  end

  def destroy
    if Food.exists?(params[:id])
      food = Food.find(params[:id])
      food.destroy
      render json: {"message" => "Food deleted"}, status: 204
    else
      render json: {"message" => "Bad request"}, status: 404
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
