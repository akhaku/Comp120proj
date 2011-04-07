class CollectionsController < ApplicationController
	def index
		@type = params[:type]
		@value = params[:value]
		case @type
		when 'artist'
			@artworks = Artwork.where("creator = ?", params[:value])
		when 'donor'
			@artworks = Artwork.where("recfrom = ?", params[:value])
		when 'location'
			@artworks = Artwork.where("location = ?", params[:value])
		else
			redirect_to ''
		end
	end
end
