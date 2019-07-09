module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    MAILFORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: MAILFORMAT }
    validates :password, presence: true, if: Proc.new { |user| user.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end

end
