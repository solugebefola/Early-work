class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :session_token,
    presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :goals, inverse_of: :user

  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = User.generate_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.valid_password?(password) ? user : nil
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
    def ensure_session_token
      self.session_token ||= User.generate_token
    end

    def self.generate_token
      SecureRandom.urlsafe_base64
    end
end
