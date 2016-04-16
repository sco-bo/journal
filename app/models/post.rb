class Post < ActiveRecord::Base
  before_save :encrypt_body 
  attr_accessor :crypt
  belongs_to :user

  # scope :public_posts, -> { where('post_type == ?', "public") }
  # scope :private_posts, -> { where('post_type == ?', "private") }

  def encrypt_body
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
    encrypted_data = crypt.encrypt_and_sign(self.body)
    self.body = encrypted_data
  end

  def decrypt
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
    crypt.decrypt_and_verify(self.body)
  end
end
