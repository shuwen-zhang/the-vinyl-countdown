class User < ApplicationRecord
	
	#PASSWORD_FORMAT = /\A
	#  (?=.{8,})          # Must contain 8 or more characters
	#  (?=.*\d)           # Must contain a digit
	#  (?=.*[a-z])        # Must contain a lower case character
	#  (?=.*[A-Z])        # Must contain an upper case character
	#  (?=.*[[:^alnum:]]) # Must contain a symbol
	#/x
	has_secure_password

	has_many :collections, dependent: :destroy	# deleting user will delete the collections
	has_many :ratings	# can rate the records in their collections

	validates :email, presence: true	

	# password not needed when editing email
	validates :password, presence: true, :unless => :already_has_password?
	# password confirmation needed only when password is created/changed
	validates :password_confirmation, presence: true, :if => :password_digest_changed?

	validates :email, 
		uniqueness: { case_sensitive: false}
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	validates :password, 
		length: { minimum: 5 },	#8
		#format: { with: PASSWORD_FORMAT },
		confirmation: true,
		:unless => :already_has_password?

	private
	    def already_has_password?
	      !self.password_digest.blank?
	    end


end
