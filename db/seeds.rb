# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.


levels = ['Beginner','Advanced','Expert']
levels.each do |l|
  level = Level.create(name: l, description: 'some description', weight: 1)
  puts "Level {level.name} created"
end

types = ['Language','Framework','System','Process','Tool']
types.each do |t|
  type = CompetencyType.create(name: t, description: 'some description', weight: 1)
  puts "Type {type.name} created"
end

if Rails.env.development?

  company = Company.create(logo: 'my_logo.jpg', name: 'My Company', description: 'My Company' )
  puts "Company #{company.name} created"

  team = Team.create(logo: 'some_logo.jpg', name: 'Fellowship of the Ring', description: '', company_id: company.id)
  puts "Team #{team.name} created"

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
