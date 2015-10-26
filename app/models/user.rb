class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :session_token,
    presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = User.generate_token
  end


  private
    def ensure_session_token
      self.session_token ||= User.generate_token
    end

    def self.generate_token
      SecureRandom.urlsafe_base64
    end
end
