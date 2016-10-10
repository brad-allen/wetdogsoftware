class Account < ApplicationRecord
  after_create :create_user_and_profile

  has_one :user, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def create_user_and_profile
      user = User.create(account_id:id, created_by:id, updated_by:id, permission:'user', status:'active') 
      Profile.create(user_id:user.id, permission:'user', status:'active', created_by:user.id, updated_by:user.id)
      #create default page...
  end
end