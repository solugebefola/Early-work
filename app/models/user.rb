class User < ActiveRecord::Base
  attr_reader  :password

  after_initialize :ensure_session_token

  validates :email,
            :password_digest,
            :session_token,
            presence: true,
            uniqueness: true

  validates :password, length: { minimum: 6, allow_nil: true} #check this


  def generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
    self.save
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password?(password)
    p self.password_digest
    BCrypt::Password.new(self.password_digest).is_password?(password)
    # pass.is_password?(password)
  end

  def self.find_by_credentials(email, password)
    return nil if email == ""
    user = User.find_by(email: email)
    user.is_password?(password) ? user : nil
  end


end
