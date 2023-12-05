json.extract! log, :id, :owner_id, :coffee_id, :grinder_id, :brewer_id, :notes, :filter_paper, :dosage, :water_temperature, :water_type, :photo, :grind_size, :bloom_time_seconds, :brew_time_seconds, :bloom_water, :total_water, :date_time, :rating, :favorite, :created_at, :updated_at
json.url log_url(log, format: :json)
