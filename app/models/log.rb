# == Schema Information
#
# Table name: logs
#
#  id                 :integer          not null, primary key
#  bloom_time_seconds :integer
#  bloom_water        :integer
#  brew_time_seconds  :integer
#  date_time          :datetime
#  dosage             :integer
#  favorite           :boolean
#  filter_paper       :string
#  grind_size         :integer
#  notes              :text
#  rating             :integer
#  total_water        :integer
#  water_temperature  :integer
#  water_type         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  brewer_id          :integer
#  coffee_id          :integer
#  grinder_id         :integer
#  owner_id           :integer
#  photo_id           :integer          not null
#
# Indexes
#
#  index_logs_on_photo_id  (photo_id)
#
# Foreign Keys
#
#  photo_id  (photo_id => photos.id)
#
class Log < ApplicationRecord
  belongs_to :photo
end
