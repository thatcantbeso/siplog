# == Schema Information
#
# Table name: grinders
#
#  id         :integer          not null, primary key
#  brand      :string
#  burr       :string
#  burr_type  :string
#  name       :string
#  power      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Grinder < ApplicationRecord
end
