class Collection < ApplicationRecord

	belongs_to :user	# many-to-one relationship with user
	has_many :collection_records, dependent: :destroy
	has_many :vinyls, through: :collection_records

	validates :name, :user_id, presence: true	

	# Each user can't have two playlists of same name
	validates :name, uniqueness: {
		scope: :user_id, case_sensitive: false, message: "already exists."}

end
