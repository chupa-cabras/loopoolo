# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.





if Rails.env.development?


  company = Company.create(logo: 'My Logo', name: 'My Company', description: 'My Company' )
  puts "Company #{company.name} created"

  team = Team.create(logo: 'some_logo.jpg', name: 'Fellowship of the Ring', description: '', company_id: company.id)
  puts "Team #{team.name} created"

  User.create(email :'dayvison.pellegrina@locaweb.com.br', name: 'chupa cabras'
              password:'senha', password_confirmation: 'senha')

  (0..30).each do |i|
    user = User.create(email: Faker::Internet.email,
                name: Faker::LordOfTheRings.character,
                password: Rails.application.secrets.default_user_password,
                password_confirmation: Rails.application.secrets.default_user_password,
                teams: [team],
                role: :hero
                )
    if user.id.present? 
      puts "User #{user.name}( #{user.email} ) created"
    else
      puts user.errors.messages.to_s
    end
  end
end




