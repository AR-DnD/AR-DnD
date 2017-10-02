class Forum < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true

  has_many :topics, :dependent => :destroy
end
