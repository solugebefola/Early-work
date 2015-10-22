class User < ActiveRecord::Base

  validates :email,
            :password_digest,
            :session_token,
            presence: true,
            uniqueness: true

  def generate_session_token
    SecureRandom::url_safe_base(64)
  end

  def reset_session_token!
    self.session_token = generate_session_token
  end

  def ensure_session_token
    session[:session_token] ||= generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def password?(password)
    self.password_digest = BCrypt::Password.password?(password)
  end

end
