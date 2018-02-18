class User < ApplicationRecord
	
	has_many :collections, dependent: :destroy	# deleting user will delete the collections
	has_many :ratings	# can rate the records in their collections

	validates :username, :password, presence: true	
	validates :username, uniqueness: {
		case_sensitive: false}

end
