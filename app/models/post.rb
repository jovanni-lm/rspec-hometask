class Post < ApplicationRecord
  validates :body, :title, :user_id, presence: true

  def publish
    update_attribute(:published, true)
  end

  def unpublish
    update_attribute(:published, false)
  end
end
