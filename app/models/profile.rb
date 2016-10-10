class Profile < ApplicationRecord
  belongs_to :user	
  has_many :profile_actions, dependent: :destroy
  has_many :groups #, dependent: :destroy
  has_many :group_invites, dependent: :destroy
  has_many :conversation_invites, dependent: :destroy
  has_many :conversations#, dependent: :destroy
  has_many :connection_invites, dependent: :destroy
  has_many :posts , dependent: :destroy
  has_many :pages , dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :connections, dependent: :destroy
  has_many :calendar_events, dependent: :destroy
end
