# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
require "faker"
require 'clearbit'

Clearbit.key = 'sk_3a50b0c299438818f2c6c6a6cb343e5c'
User.destroy_all
Apply.destroy_all
Organization.destroy_all

alpha = ("a".."z").to_a
@organizations = []
alpha.each do |letter|
  url = "https://autocomplete.clearbit.com/v1/companies/suggest?query=:#{letter}"
  user_serialized = URI.open(url).read
  companies = JSON.parse(user_serialized)
  companies.each do |company|
  @organization = Organization.create!(name:company["name"],description: company["domain"], logo: company["logo"])
  @organizations << @organization
end
end

@user = User.create!(linkedin_url: Faker::Internet.url, email: "user@email.fr",
password: "azerty",first_name: Faker::Name.first_name,last_name:Faker::Name.last_name)





4.times do
@organization= @organizations.sample
 3.times do
   @apply = Apply.create!(job_title: Faker::Company.profession, description: Faker::Lorem.sentence(word_count: 10),status:["Ready to apply","Applied", "Ongoing process","Waiting for answer"].sample,user_id:@user.id,organization_id: @organization.id, location: Faker::Nation.capital_city   )

   2.times do
    @interview = Interview.create!(date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25') ,start_time:Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) , end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),step: "interview #{(1..10).to_a.sample}", notes:Faker::Lorem.sentence(word_count: 10),apply_id:@apply.id)
    
    @review = Review.create!(interview_id: @interview.id, comment: Faker::Lorem.sentence(word_count: 10), rating: (1..10).to_a.sample)

  end
 end
end
