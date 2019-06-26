class User < ApplicationRecord
  # MAILFORMAT = '^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$'
  # validates :email, presence: true, format: { with: MAILFORMAT }
  # не получается сделать с регулярным выражением

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :created_tests, class_name: :Test, foreign_key: :creator_id
  has_many :tests_users
  has_many :tests, through: :tests_users

  def show_tests_level(level)
    tests.where(level: level)
  end

end
