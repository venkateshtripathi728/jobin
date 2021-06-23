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
   @apply = Apply.create!(job_title: "Data science", description: "very good profile",status:"pending",user_id:@user.id,organization_id: @organization.id  )

   4.times do
    @interview = Interview.create!(start_date: Date.new(2013,12,12),end_date: Date.new(2013,11,11),step: "hr interview", notes:"mynotes",apply_id:@apply.id)
    end
 end
end
