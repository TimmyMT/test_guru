class Feedback
  include ActiveModel::Model

  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates :title, :body, :email, presence: true

  attr_accessor :title, :body, :email, :admin

  def initialize(attributes = {title=>"", body=>"", email=>""})
    @title = attributes["title"]
    @body = attributes["body"]
    @email = attributes["email"]
    @admin = User.find_by(type: 'Admin')
  end

  def persisted?
    false
  end

end
