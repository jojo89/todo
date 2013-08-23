require_relative '../app/models/task'
require 'faker'

15.times do 
  Task.create!(
      # :description => Faker::Name.name 
       :description => Faker::Lorem.words(rand(3..10))
      )
end 
