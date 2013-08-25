require_relative '../app/models/task'
require 'faker'

5.times do 
  List.create!(:name => Faker::Name.name)
end

15.times do 
  Task.create!(
    :list_id => rand(1..5),
    :description => Faker::Name.name
    )
end 
