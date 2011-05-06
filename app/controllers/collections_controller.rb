class CollectionsController < ApplicationController
	def index
	end
	
	def category
		@type = params[:type]
		@value = params[:value]
		
		unless type.nil?
  		dbartworks = Artwork.filter_by(params[:type], params[:value])
		else
			redirect_to ''
		end
		
		@artworks = dbartworks.each do |art|
		  art.imglink = 'http://s3.amazonaws.com/Art_Images/' + art.filename
	  end
		
		respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @artworks }
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
