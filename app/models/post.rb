class Post < ApplicationRecord
  validates :body, :title, :user_id, presence: true
end
