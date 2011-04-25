require 'aws/s3'

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
			AWS::S3::Base.establish_connection!(
				:access_key_id     => '',
				:secret_access_key => ''
			)
			imglink = (AWS::S3::S3Object.url_for(artwork.filename + '.jpg','Art_Images'))
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
		
	end
end
