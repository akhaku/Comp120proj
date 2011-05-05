class ArtworkDescriptor
	def initialize(title, creator, date, object, description, recfrom, location, imglink)
		@title = title
		@creator = creator
		@date = date
		@object = object
		@description = description
		@recfrom = recfrom
		@location = location
		@imglink = imglink
	end
	
	attr_accessor :title, :creator, :date, :object, :description, :recfrom, :location, :imglink
end

class CollectionsController < ApplicationController
	def index
	end
	
	def category
		@type = params[:type]
		@value = params[:value]
		
		case @type
		when 'artist'
			dbartworks = Artwork.where("creator = ?", params[:value])
		when 'donor'
			dbartworks = Artwork.where("recfrom = ?", params[:value])
		when 'location'
			dbartworks = Artwork.where("location = ?", params[:value])
		else
			redirect_to ''
		end

		@artworks = []
		dbartworks.each do |artwork|
			imglink = 'http://s3.amazonaws.com/Art_Images/' + artwork.filename
			@artworks.push(ArtworkDescriptor.new(artwork.title,
												artwork.creator,
												artwork.date,
												artwork.object,
												artwork.description,
												artwork.recfrom,
												artwork.location,
												imglink))
		end
	end
	
	def artists
		@artists = Artwork.order('creator ASC').uniq_by{|h| h.creator}
	end
	
	def donors
		@donors = Artwork.order('recfrom ASC').uniq_by{|h| h.recfrom}
	end
	
	def locations
		@locations = Artwork.order('location ASC').uniq_by{|h| h.location}
	end
end
