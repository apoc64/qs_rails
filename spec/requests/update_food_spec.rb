require 'rails_helper'

describe "update food" do
  it 'updates the proper food' do

    food = Food.create(name: "Banana", calories: 150)

    params = { "food": { "name": "Mint", "calories": "14"} }
    patch "/api/v1/foods/#{food.id}", params: params

    expect(response).to be_successful
    expect(Food.count).to eq(1)
    expect(Food.all.first.name).to eq("Mint")
    expect(Food.all.first.calories).to eq(14)
  end

  it 'returns a 404 with no food' do
    params = { "food": { "name": "Mint", "calories": "14"} }
    patch "/api/v1/foods/3", params: params

    expect(response.status).to eq(404)
  end
end
