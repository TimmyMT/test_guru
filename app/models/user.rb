class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable


  # MAILFORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :created_tests, class_name: :Test, foreign_key: :creator_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  # validates :email, presence: true, uniqueness: true, format: { with: MAILFORMAT }

  # has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def show_tests_level(level)
    tests.where(level: level)
  end

end
