class Group < ApplicationRecord
  belongs_to :profile
  has_many :pages, dependent: :destroy
  has_many :group_members, dependent: :destroy
  has_many :group_invites, dependent: :destroy
  has_many :group_actions, dependent: :destroy
end
