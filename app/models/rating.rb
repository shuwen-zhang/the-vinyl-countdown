class Rating < ApplicationRecord
	validates :star, numericality: {
		only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5},
		allow_blank: true
	validates :vinyl_id, uniqueness: {
		scope: :user_id, message: "has already been rated by the User."}

end
