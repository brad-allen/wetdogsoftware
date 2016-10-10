class User < ApplicationRecord
	belongs_to :account
	has_many :profiles

end
