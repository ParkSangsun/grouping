# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


    #user1 = User.create :nickname => "User1", :email => "user1@example.com", :password => "1234", :password_confirmation => "1234"
    #user2 = User.create :nickname => "User2", :email => "user2@example.com", :password => "1234", :password_confirmation => "1234"
    #user3 = User.create :nickname => "User3", :email => "user3@example.com", :password => "1234", :password_confirmation => "1234"
    #user4 = User.create :nickname => "User4", :email => "user4@example.com", :password => "1234", :password_confirmation => "1234"
    #user5 = User.create :nickname => "User5", :email => "user5@example.com", :password => "1234", :password_confirmation => "1234"


  user1 = User.create(
      :email                 => "user1@gmail.com",
      :nickname              => "user1",
      :password              => "12341234",
      :password_confirmation => "12341234"
      
  )
  user1.skip_confirmation!
  user1.save!
  
  
  user2 = User.create(
      :email                 => "user2@gmail.com",
      :nickname              => "user2",
      :password              => "12341234",
      :password_confirmation => "12341234"
      
  )
  user2.skip_confirmation!
  user2.save!
  
  user3 = User.create(
      :email                 => "user3@gmail.com",
      :nickname              => "user3",
      :password              => "12341234",
      :password_confirmation => "12341234"
      
  )
  user3.skip_confirmation!
  user3.save!
  
  user4 = User.create(
      :email                 => "user4@gmail.com",
      :nickname              => "user4",
      :password              => "12341234",
      :password_confirmation => "12341234"
      
  )
  user4.skip_confirmation!
  user4.save!
  
  user5 = User.create(
      :email                 => "user5@gmail.com",
      :nickname              => "user5",
      :password              => "12341234",
      :password_confirmation => "12341234"
      
  )
  user5.skip_confirmation!
  user5.save!
  
