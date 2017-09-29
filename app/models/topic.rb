class Topic < ApplicationRecord
  belongs_to :forum
  has_many :posts, :dependent => :destroy
end
