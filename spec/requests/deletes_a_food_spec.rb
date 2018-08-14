require 'rails_helper'

describe "delete food" do
  it 'deletes the proper food' do

    food = Food.create(name: "Banana", calories: 150)

    delete "/api/v1/foods/#{food.id}"

    expect(response.status).to eq(204)
    expect(Food.count).to eq(0)
  end

  it 'returns a 404 with no food' do
    food = Food.create(name: "Banana", calories: 150)

    delete "/api/v1/foods/#{food.id + 1}"

    expect(response.status).to eq(404)
    expect(Food.count).to eq(1)
  end
end
