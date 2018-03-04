class CollectionRecord < ApplicationRecord
	
	belongs_to :collection
	belongs_to :vinyl

	validates :collection_id, :vinyl_id, presence: true	

	# Can't have two copies of same vinyl in a collection
	validates :vinyl_id, uniqueness: {
		scope: :collection_id }

end
