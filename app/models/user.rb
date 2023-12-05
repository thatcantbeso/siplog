# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #  validates :username, presence: true, uniqueness: true

  has_many :logs, class_name: "Log", foreign_key: "owner_id", dependent: :destroy
  has_many :coffees, class_name: "Coffee", foreign_key: "owner_id", dependent: :destroy
  has_many :grinders, class_name: "Grinder", foreign_key: "owner_id", dependent: :destroy
  has_many :brewers, class_name: "Brewer", foreign_key: "owner_id", dependent: :destroy
end
