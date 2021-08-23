class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  validates :name, :body, presence: true
end
