class CommentWidget < ApplicationRecord
  belongs_to :post
  has_one :widget_style
  has_many :comments, dependent: :destroy
end
