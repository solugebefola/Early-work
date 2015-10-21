class User < ActiveRecord::Base
attr_reader :password
validates :user_name, :password_digest, :session_token, presence: true
validates :session_token, :user_name, uniqueness: true

after_initialize :set_session_token

def set_session_token
  self.session_token ||= SecureRandom::urlsafe_base64
end

def reset_session_token!
  self.session_token = SecureRandom::urlsafe_base64
  self.save!
end

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end
