# == Schema Information
#
# Table name: coffees
#
#  id            :integer          not null, primary key
#  cup_score     :integer
#  elevation     :integer
#  favorite      :boolean
#  name          :string
#  notes         :text
#  process       :string
#  producer      :string
#  region        :string
#  roast_date    :date
#  roast_level   :integer
#  roaster       :string
#  species       :string
#  subregion     :string
#  tasting_notes :string
#  varietal      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :integer
#
class Coffee < ApplicationRecord
  belongs_to :owner, required: true, class_name: "User", foreign_key: "owner_id"
  has_many :logs, class_name: "Log", foreign_key: "coffee_id", dependent: :destroy
end
