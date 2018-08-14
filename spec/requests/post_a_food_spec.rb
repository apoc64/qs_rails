require 'rails_helper'

describe "post a food" do
  it 'adds a food in database' do

    post "/api/v1/foods", params: {food: {name: "banana", calories: 150}}

    expect(response).to be_successful
    food = Food.all.first
    expect(food.name).to eq("banana")
    expect(food.calories).to eq(150)
  end

  it "wont add invalid food" do
    post "/api/v1/foods", params: {food: {title: "apple", calories: "five hundred"}}

    expect(Food.count).to eq(0)
  end
end
