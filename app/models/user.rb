class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username

  has_many :posts
  
  def public_posts
    self.posts.where('post_type == ?', "public")
  end

  def private_posts
    self.posts.where('post_type == ?', "private")
  end

  def email_required? 
    false
  end

  def email_changed? 
    false
  end
end
