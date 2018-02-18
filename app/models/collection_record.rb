class CollectionRecord < ApplicationRecord
	
	belongs_to :collection
	belongs_to :vinyl

	validates :collection_id, :vinyl_id, presence: true	

	# Can't have two copies of same vinyl in a collection
	validates :collection_id, uniqueness: {
		scope: :vinyl_id}

end
