class ConnectionInvite < ApplicationRecord
  belongs_to :profile
  belongs_to :connection_profile, :class_name => 'Profile'
end
