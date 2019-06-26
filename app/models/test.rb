class Test < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  belongs_to :category

  has_many :questions, dependent: :nullify
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validate :validate_level, on: :create

  scope :level_low, -> { where(level: 0..1) }
  scope :level_medium, -> { where(level: 2..4) }
  scope :level_high, -> { where(level: 5..Float::INFINITY) }

  scope :sort_category, lambda { |name|
      joins(:category)
      .where(categories: {title: name})
      .order(title: :desc)
  }

  def self.sort_on_category(name)
    sort_category(name).pluck(:title)
  end

  private

  def validate_level
    errors.add(:level) if level.to_i > 10 #|| level.to_i < 0
  end

end
