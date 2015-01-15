class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :content,  presence: true
  validates :content, length: { maximum: 140 }
end




#Add in validation once session/users are incorporated into Minitwitter
# :user_id,
