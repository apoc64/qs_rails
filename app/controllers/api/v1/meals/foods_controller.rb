class Api::V1::Meals::FoodsController < ApplicationController
  def index
    meal = Meal.find(params[:id])
    render json: meal
  end
end
