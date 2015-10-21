class TokenEnvironment < ActiveRecord::Base
  validates :user_id, :browser, :device, :token, presence: true

  
end
