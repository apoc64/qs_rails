class Api::V1::Meals::FoodsController < ApplicationController
  def index
    if Meal.exists?(params[:id])
      meal = Meal.find(params[:id])
      render json: meal
    else
      render json: {"message" => "Bad request"}, status: 404
    end
  end
end
