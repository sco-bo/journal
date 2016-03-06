class User < ActiveRecord::Base
  attr_accessor :token
  validates :username, presence: true, 
            length: {maximum: 50}, 
            uniqueness: {case_sensitive: false}

  validates :password, presence: true, 
            length: {minimum: 6}, 
            allow_nil: true
  has_secure_password

  #Return random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.token = User.new_token
    self.remember_token = Digest::SHA1.hexdigest(token)
  end
end
