require 'rails_helper'

describe "get all foods" do
  it 'returns all foods in database' do

    food = Food.create(name: "Banana", calories: 150)

    get "/api/v1/foods/#{food.id}"

    expect(response).to be_successful
    body = JSON.parse(response.body)
    expect(body).to be_a(Hash)

    expect(body).to eq({
      "id" => food.id,
      "name" => "Banana",
      "calories" => 150
      })
  end
  # When I get a request: GET /api/v1/foods/:id
  # It returns the food object or a 404
end
