require 'rails_helper'

describe "post a food to a meal" do
  it 'adds a food to that meal' do
    breakfast = Meal.create(name: "breakfast")
    pizza = breakfast.foods.create(name: "pizza", calories: 400)

    delete "/api/v1/meals/#{breakfast.id}/foods/#{pizza.id}"

    expect(response).to be_successful
    expected = {
      "message" => "Successfully removed PIZZA to BREAKFAST"
    }
    body = JSON.parse(response.body)
    expect(body).to eq(expected)

    expect(breakfast.foods.count).to eq(0)
  end

  it 'returns a 404 if the food does not belong to meal' do
    breakfast = Meal.create(name: "breakfast")
    pizza = Food.create(name: "pizza", calories: 400)

    delete "/api/v1/meals/#{breakfast.id}/foods/#{pizza.id}"

    expect(response.status).to eq(404)
  end

  it 'returns a 404 if the meal does not exist' do
    breakfast = Meal.create(name: "breakfast")
    pizza = Food.create(name: "pizza", calories: 400)

    delete "/api/v1/meals/#{breakfast.id + 1}/foods/#{pizza.id}"

    expect(response.status).to eq(404)
  end
end
