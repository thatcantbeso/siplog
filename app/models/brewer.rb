# == Schema Information
#
# Table name: brewers
#
#  id         :integer          not null, primary key
#  brand      :string
#  geometry   :string
#  material   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Brewer < ApplicationRecord

  belongs_to :owner, required: true, class_name: "User", foreign_key: "owner_id"
  has_many :logs, class_name: "Log", foreign_key: "brewer_id", dependent: :destroy
end
