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
#  photo              :string
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
#
class Log < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :owner, required: true, class_name: "User", foreign_key: "owner_id"
  belongs_to :grinder, required: true, class_name: "Grinder", foreign_key: "grinder_id"
  belongs_to :coffee, required: true, class_name: "Coffee", foreign_key: "coffee_id"
  belongs_to :brewer, required: true, class_name: "Brewer", foreign_key: "brewer_id"
end
