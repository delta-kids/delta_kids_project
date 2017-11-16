class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :resources 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX

  before_validation :downcase_email

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def downcase_email
    self.email&.downcase!
  end

end
