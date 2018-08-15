class Api::V1::Meals::FoodsController < ApplicationController
  def index
    if Meal.exists?(params[:id])
      meal = Meal.find(params[:id])
      render json: meal
    else
      render json: {"message" => "Bad request"}, status: 404
    end
  end

  def create
    if Meal.exists?(params[:meal_id]) && Food.exists?(params[:food_id])
      meal = Meal.find(params[:meal_id])
      food = Food.find(params[:food_id])
      meal.foods << food
      render json: {"message" => "Successfully added #{food.name.upcase} to #{meal.name.upcase}"}, status: 201
    else

    end
  end
end
