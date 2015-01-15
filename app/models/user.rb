class User < ActiveRecord::Base
  has_many :tweets
  validates :handle, presence: true
end
