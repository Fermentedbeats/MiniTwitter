class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets
  validates :handle, presence: true

  # has_many :follows, :foreign_key => "follower_id", :class_name => "Follow", :dependent => :destroy
  # has_many :users_followed, :through => :follows, :source => :followed

  # has_many :followings, :foreign_key => "followed_id", :class_name => "Follow", :dependent => :destroy
  # has_many :users_following, :through => :followings, :source => :follower

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

end


