class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :blog
  belongs_to :user
end