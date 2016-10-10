class ConversationInvite < ApplicationRecord
  belongs_to :conversation
  belongs_to :profile
  belongs_to :invited_profile, :class_name => 'Profile'
end
