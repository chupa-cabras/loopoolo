# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.



if Rails.env.development?
  (0..30).each do |i|
    user = User.create(email: Faker::Internet.email,
                name: Faker::LordOfTheRings.character,
                password: Rails.application.secrets.default_user_password,
                password_confirmation: Rails.application.secrets.default_user_password
                )

    puts "User #{user.name}( #{user.email} ) created"
  end
end
