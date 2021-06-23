# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
  User.destroy_all
  @user = User.create!(linkedin_url: Faker::Internet.url, email: Faker::Internet.email,
  password: "vtrllucknow",first_name: Faker::Name.first_name,last_name:Faker::Name.last_name)
  Organization.destroy_all
  @organization1 = Organization.create!(name:'a',category:'electric',description:'big')
  @organization2 = Organization.create!(name:'b',category:'computer',description:'small')
  @organization3 = Organization.create!(name:'c',category:'business',description:'medium')
  @organization4 = Organization.create!(name:'d',category:'engineering',description:'startup')
  @organizations = [@organization1,@organization2,@organization3,@organization4]
  
@organizations.each  do |organization|
 3.times do
   @application = Application.create!(job_title: "Data science", description: "very good profile",status:"pending",user_id:@user.id,organization_id:organization.id)
   
   4.times do 
    @interview = Interview.create!(start_date: Date.new(2013,12,12),end_date: Date.new(2013,11,11),step: "hr interview", notes:"mynotes",application_id:@application.id)
    @interview.save
  end
end
end
