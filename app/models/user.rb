class User < ApplicationRecord

  has_many :created_tests, class_name: :Test, foreign_key: :creator_id
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :feedbacks, dependent: :nullify

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  validates :first_name, :last_name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def show_tests_level(level)
    tests.where(level: level)
  end

  def admin?
    is_a?(Admin)
  end

end
