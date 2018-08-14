require 'rails_helper'

describe "get all foods" do
  it 'returns all foods in database' do

    Food.create(name: "Banana", calories: 150)

    get "api/v1/foods"

    expect(response).to be_successful
    body = JSON.parse(response.body)
    expect(body).to be_a(Array)
    expect(body.first).to be_a(Hash)
    expect(body.first["name"]).to eq("Banana")
    expect(body.first["calories"]).to eq(150)
  end
end
