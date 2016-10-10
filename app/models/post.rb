class Post < ApplicationRecord
  belongs_to :profile
  belongs_to :page, optional: true
  has_one :comment_widget, dependent: :destroy
end
