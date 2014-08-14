# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    user_attributes: {}.tap do |h|
      3.times do
        h[Faker::Product.brand] = Faker::Product.product_name
      end
    end
  )
end
