# Quantified Self

This app provides a Rails based backend for a calorie tracking app. The frontend is deployed at http://meek-worm.surge.sh/index.html, with this backend at, https://fathomless-beach-36935.herokuapp.com/

## Ruby version
This app uses:
Ruby 2.4.2
Rails 5.2

## Setup
After cloning this project, run
bundle install
rake db:create
rake db:migrate

The app is dependent upon the following meals, created from the command line.
Run
rails c

From the Rails console:
Meal.create(id: 1, name: "Breakfast")
Meal.create(id: 2, name: "Snack")
Meal.create(id: 3, name: "Lunch")
Meal.create(id: 4, name: "Dinner")

## Testing

To run the test suite, run

rspec
