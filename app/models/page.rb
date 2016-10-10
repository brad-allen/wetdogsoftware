class Page < ApplicationRecord
  belongs_to :profile
  belongs_to :profile
  has_many :posts, dependent: :destroy
end
