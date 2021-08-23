class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :name,:body, presence: true
end
