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
         "dev:add_grinders",
         "dev:add_brewers",
         "dev:add_coffees",
       ] do
    puts "done"
  end

  task add_users: :environment do
    puts "add users"

    names = ["jun", "thierry", "ian", "tony", "chase", "jesus", "andre", "derek", "nour", "alejandra", "ainsley", "gustavo"]

    names.each do |name|
      u = User.create(
        email: "#{name}@example.com",
        password: "password",
        first_name: "#{name}",
        last_name: Faker::Name.last_name,
      )
    end
  end

  task add_grinders: :environment do
    puts "add grinders"

    brands = ["Baratza", "Eureka", "1zpresso", "Turin"]
    names = ["encore", "mignon", "k1 ultra", "df64", "df83"]
    powers = ["electric", "power"]
    burr_types = ["flat", "conical"]
    burrs = ["stock", "diamond like coating", "high uniformity", "lab sweet"]

    User.all.each do |user|
      brand = brands.sample
      name = names.sample
      power = powers.sample
      burr_type = burr_types.sample
      burr = burrs.sample

      g = Grinder.create(
        owner_id: user.id,
        brand: brand,
        name: name,
        power: power,
        burr_type: burr_type,
        burr: burr,
      )
    end
  end

  task add_brewers: :environment do
    puts "add brewers"

    brands = ["Hario", "Kalita", "Orea", "Origami"]
    names = ["v60", "switch", "v3", "brewer"]
    materials = ["plastic", "ceramic", "copper"]
    geometrys = ["flat", "conical"]

    User.all.each do |user|
      brand = brands.sample
      name = names.sample
      material = materials.sample
      geometry = geometrys.sample

      b = Brewer.create(
        owner_id: user.id,
        brand: brand,
        name: name,
        material: material,
        geometry: geometry,
      )
    end
  end

  task add_coffees: :environment do
    puts "add coffees"

    species = ["arabica", "robusta"]
    varietals = ["typica", "robusta", "gesha", "bourbon"]
    processes = ["swiss water", "washed", "natural", "koji co-ferment", "honey"]
    elevations = ["1000", "500", "1250", "1600"]
    regions = ["kenya", "ethiopia", "colombia", "el salvador"]
    subregions = ["Yirgacheffe", "Sao Paolo", "Ocotepeque", "Alta Mogiana Mineira", "Huehuetenango"]
   # roast_levels_sample = rand(1..100)
   # roast_dates = Faker::Date.backward(days: 365)
   # cup_scores_sample = rand(1..100)
    tasting_notes = ["sweet", "fruit", "sugar", "charcoal", "woody", "lemon", "strawberry", "cinnamon"]
    names = ["coffee name 1", "coffee name 2", "coffee name 3"]
    roasters = ["hydrangea", "onyx", "black white", "botz", "4LW"]
   # producers = Faker::Name.name
    favorites = [true, false]
   # notes = Faker::Quote.famous_last_words

    User.all.each do |user|
      15.times do
        specie = species.sample
        varietal = varietals.sample
        process = processes.sample
        elevation = elevations.sample
        region = regions.sample
        subregion = subregions.sample
      #  roast_level = roast_levels_sample
      #  roast_date = roast_dates
      #  cup_score = cup_scores_sample
        tasting_note = tasting_notes.sample
        name = names.sample
        roaster = roasters.sample
       # producer = producers
        favorite = favorites.sample
       # notes = notes

        c = Coffee.create(
          owner_id: user.id,
          species: specie,
          varietal: varietal,
          process: process,
          elevation: elevation,
          region: region,
          subregion: subregion,
          roast_level: rand(1..100),
          roast_date: Faker::Date.backward(days: 365),
          cup_score: rand(1..100),
          tasting_notes: tasting_note,
          name: name,
          roaster: roaster,
          producer: Faker::Name.name,
          favorite: favorites,
          notes: Faker::Quote.famous_last_words,
        )
      end
    end
  end
end
