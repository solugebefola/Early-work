class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true, uniqueness: true

  def self.generate_session_token
    SecureRandom::urlsafe_base64.new
  end

  def reset_token!
    self.session_token = User.generate_session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    self.password_object.is_password?(password)
  end

  def password_object
    BCrypt::Password.new(self.password_digest)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end
end
