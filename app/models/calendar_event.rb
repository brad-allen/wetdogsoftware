class CalendarEvent < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :profile
  belongs_to :group, optional: true
end
