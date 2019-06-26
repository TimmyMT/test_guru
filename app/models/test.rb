class Test < ApplicationRecord
  validates :title, presence: true
  validates :level, numericality: { only_integer: true }, allow_nil: true
  validates :test, uniqueness: { scope: [:title, :level] }

  validate :validate_max_level, on: :create

  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  belongs_to :category

  has_many :questions, dependent: :nullify
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :level_low, -> { self.where(level: 0..1) }
  scope :level_medium, -> { self.where(level: 2..4) }
  scope :level_high, -> { self.where(level: 5..Float::INFINITY) }

  scope :sort_category, lambda { |name|
      self.joins(:category)
      .where(categories: {title: name})
      .order(title: :desc)
  }

  def self.sort_on_category(name)
    sort_category(name).pluck(:title)
  end

  private

    def validate_max_level
      errors.add(:level) if level.to_i > 10
    end

end
