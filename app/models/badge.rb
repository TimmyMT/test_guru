class Badge < ApplicationRecord
  has_many :badge_users, dependent: :nullify
  has_many :users, through: :badge_users

end
