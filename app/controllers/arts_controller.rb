class ArtsController < CmsapplicationController
  def index
    @artwork=Artwork.new
    @artworks = Artwork.paginate(:page => params[:page], :per_page=>10)
  end

  # GET /arts/1
  def show
    @artwork = Artwork.find(params[:id])
  end

  # GET /arts/new
  def new
    @artwork = Artwork.new
  end

  # GET /arts/1/edit
  def edit
    @artwork = Artwork.find(params[:id])
  end

  # POST /arts
  def create
    @artwork = Artwork.new(params[:artwork])
    if @artwork.save
      render :action=>"show", :notice => 'Artwork was successfully created.', :id=>@artwork.id
    else
      render :action => "new"
    end
  end

  # PUT /arts/1
  def update
    @artwork = Artwork.find(params[:id])

    if @artwork.update_attributes(params[:artwork])
      redirect_to(@artwork, :notice => 'Artwork was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /artworks/1
  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to(arts_url)
  end
end
