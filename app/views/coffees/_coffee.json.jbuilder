json.extract! coffee, :id, :owner_id, :species, :varietal, :process, :elevation, :region, :subregion, :roast_level, :roast_date, :cup_score, :tasting_notes, :name, :roaster, :producer, :favorite, :notes, :created_at, :updated_at
json.url coffee_url(coffee, format: :json)
