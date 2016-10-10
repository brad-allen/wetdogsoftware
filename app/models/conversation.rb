class Conversation < ApplicationRecord
  belongs_to :profile
  has_many :conversation_members, dependent: :destroy
  has_many :conversation_invites, dependent: :destroy
  has_many :messages, dependent: :destroy
end
