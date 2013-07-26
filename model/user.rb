class User < ActiveRecord::Base
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
end
