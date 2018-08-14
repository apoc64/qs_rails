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

    it 'returns a 404 with no food' do
      food = Food.create(name: "Banana", calories: 150)
      get "/api/v1/foods/#{food.id + 1}"
      expect(response).to_not be_successful
      expect(response.status).to be(404)
    end
  end
