require 'rails_helper'

describe "post a food to a meal" do
  it 'adds a food to that meal' do
    breakfast = Meal.create(name: "breakfast")
    pizza = Food.create(name: "pizza", calories: 400)

    post "/api/v1/meals/#{breakfast.id}/foods/#{pizza.id}"

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expected = {
      "message" => "Successfully added PIZZA to BREAKFAST"
    }
    body = JSON.parse(response.body)
    expect(body).to eq(expected)
  end

  it 'returns a 404 if unseccessful' do
    breakfast = Meal.create(name: "breakfast")
    pizza = Food.create(name: "pizza", calories: 400)

    post "/api/v1/meals/#{breakfast.id + 1}/foods/#{pizza.id + 1}"

    expect(response.status).to eq(404)
  end
end
