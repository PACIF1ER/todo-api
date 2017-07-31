 class User < ActiveRecord::Base
  before_create :confirmation_token
  has_many :tasks

  validates :password, length: { minimum: 5 }, if: :password
  validates_confirmation_of :password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [:create, :update] }
  validates_uniqueness_of :email, message: "has already been taken."
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_secure_password

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
    false
  end

  def generate_auth_token
    payload = { user_id: id }
    AuthTokenService.encode(payload)
  end

  def full_name
    "#{first_name} #{last_name}"
  rescue
    "Guest"
  end

  def email_activate
    self.email_confirmation = true
    self.email_token = nil
    save!(:validate => false)
  end

  private
    def confirmation_token
      if self.email_token.blank?
        self.email_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
