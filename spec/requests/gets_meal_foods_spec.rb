require 'rails_helper'

describe "get all foods" do
  it 'returns all foods in database' do
    breakfast = Meal.create(name: "Breakfast")
    banana = breakfast.foods.create(name: "Banana", calories: 150)
    yogurt = breakfast.foods.create(name: "Yogurt", calories: 550)
    apple = breakfast.foods.create(name: "Apple", calories: 220)


    get "/api/v1/meals/#{breakfast.id}/foods"

    expect(response).to be_successful
    expected = {
      "id" => breakfast.id,
      "name" => "Breakfast",
      "foods" => [
        {
          "id" => banana.id,
          "name" => "Banana",
          "calories" => 150
        },
        {
          "id" => yogurt.id,
          "name" => "Yogurt",
          "calories" => 550
        },
        {
          "id" => apple.id,
          "name" => "Apple",
          "calories" => 220
        }
      ]
    }

    body = JSON.parse(response.body)
    expect(body).to eq(expected)
  end

  it 'returns a 404 if meal not found' do
    breakfast = Meal.create(name: "Breakfast")
    banana = breakfast.foods.create(name: "Banana", calories: 150)
    yogurt = breakfast.foods.create(name: "Yogurt", calories: 550)
    apple = breakfast.foods.create(name: "Apple", calories: 220)


    get "/api/v1/meals/#{breakfast.id + 1}/foods"

    expect(response.status).to eq(404)
  end
end
