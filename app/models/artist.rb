class Artist < ApplicationRecord
	has_many :vinyls, dependent: :destroy	# deleting artist will delete the records
	validates :name, presence: true
	validates :name, uniqueness: true
end
