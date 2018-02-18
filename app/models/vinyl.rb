class Vinyl < ApplicationRecord
	
	belongs_to :artist	# many-to-one relationship with artist
	has_many :collection_records
	has_many :collections, through: :collection_records
	has_many :ratings		# rated by many users

	# validates that attributes are not empty before saving into database
	validates :title, :year, :artist_id, presence: true	
	validates :year, numericality: {
		only_integer: true, greater_than: 1800, less_than_or_equal_to: Date.today.year}
	validates :runtime, numericality: {
		only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 500},
		allow_blank: true
	
	# validate that duplicate vinyls aren't added
	validates :title, uniqueness: {
		scope: :artist_id, case_sensitive: false, message: "and Artist combination already exists."}

end
