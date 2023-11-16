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
end
