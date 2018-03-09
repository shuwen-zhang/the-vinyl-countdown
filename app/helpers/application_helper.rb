module ApplicationHelper

	def print_image(url)
		url = Rails.application.assets.find_asset(url).nil? ? nil : url
		image_tag(url || 'na.png', :class => "img-fluid circular_image")
	end

	
end
