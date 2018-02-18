class User < ApplicationRecord
	
	PASSWORD_FORMAT = /\A
	  (?=.{8,})          # Must contain 8 or more characters
	  (?=.*\d)           # Must contain a digit
	  (?=.*[a-z])        # Must contain a lower case character
	  (?=.*[A-Z])        # Must contain an upper case character
	  (?=.*[[:^alnum:]]) # Must contain a symbol
	/x

	has_many :collections, dependent: :destroy	# deleting user will delete the collections
	has_many :ratings	# can rate the records in their collections

	validates :username, :password, presence: true	

	validates :username, 
		uniqueness: { case_sensitive: false}

	validates :password, 
		length: { minimum: 8 },
		format: { with: PASSWORD_FORMAT },
		confirmation: true

end
