class User < ActiveRecord::Base
  has_many :tweets
  validates :handle, presence: true

  # has_many :follows, :foreign_key => "follower_id", :class_name => "Follow", :dependent => :destroy
  # has_many :users_followed, :through => :follows, :source => :followed

  # has_many :followings, :foreign_key => "followed_id", :class_name => "Follow", :dependent => :destroy
  # has_many :users_following, :through => :followings, :source => :follower

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

end


