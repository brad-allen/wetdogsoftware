class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :comment_widget
end
