class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :content, :user_id, presence: true
  validates :content, length: { maximum: 140 }
end
