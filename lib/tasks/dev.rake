namespace :dev do
  desc "drops, creates, migrates, and adds sample data"
  task reset: [
         :environment,
         "db:drop",
         "db:create",
         "db:migrate",
         "dev:sample_data",
       ]

  desc "adds sample data for development environment"
  task sample_data: [
    :environment,
     "dev:add_users",
     "dev:add_grinders"
     ] do
    puts "done"
  end

  task add_users: :environment do
    puts "add users"
    # TODO: add

    names = ["jun", "thierry", "ian", "tony", "chase", "jesus", "andre", "derek", "nour"]

    names.each do |name|
      u = User.create(
        email: "#{name}@example.com",
        password: "password",
        first_name: "#{name}",
        last_name: Faker::Name.last_name,
      )
      puts "added #{u.email}"
    end
    puts "done"
  end
end
