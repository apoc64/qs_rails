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
      render json: {"message" => "Bad request"}, status: 404
    end
  end

  def destroy
    if Meal.exists?(params[:meal_id])
      meal = Meal.find(params[:meal_id])
      if meal.foods.exists?(params[:food_id])
        food = meal.foods.find(params[:food_id])
        meal_food = meal.meal_foods.find_by(food_id: params[:food_id])
        meal_food.destroy
        render json: {"message" => "Successfully removed #{food.name.upcase} to #{meal.name.upcase}"}
      else
        render json: {"message" => "Bad request"}, status: 404
      end
    else

    end
  end
end
