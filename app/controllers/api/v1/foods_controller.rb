class Api::V1::FoodsController < ActionController::API
  def index
    foods = Food.all
    render json: foods
  end
end
