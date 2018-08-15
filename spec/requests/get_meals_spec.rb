require 'rails_helper'

describe "get all meals" do
  it 'adds returns meals with their foods' do
    breakfast = Meal.create(name: "Breakfast")
    banana = breakfast.foods.create(name: "Banana", calories: 150)
    yogurt = breakfast.foods.create(name: "Yogurt", calories: 550)
    apple = breakfast.foods.create(name: "Apple", calories: 220)
    snack = Meal.create(name: "Snack")
    snack.foods << banana
    gum = snack.foods.create(name: "Gum", calories: 50)


    get "/api/v1/meals"

    expect(response).to be_successful
    # It returns all the meals with their associated foods
    # with this format:
    expected = [
      {
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
      },
      {
        "id" => snack.id,
        "name" => "Snack",
        "foods" => [
          {
            "id" => banana.id,
            "name" => "Banana",
            "calories" => 150
          },
          {
            "id" => gum.id,
            "name" => "Gum",
            "calories" => 50
          }
        ]
      }]

      body = JSON.parse(response.body)
      expect(body).to eq(expected)
    end
  end
