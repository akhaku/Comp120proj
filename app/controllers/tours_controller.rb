class ToursController < CmsapplicationController
  def index
    @tours = Tour.all
  end
  
  def tour_items
    @tour_item = TourItem.new
    @tours = Tour.all
    @artworks = Artwork.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create_tour_item
    @tour_item = TourItem.new(params[:touritem])
    if @tour_item.save
      redirect_to(tours_path)
    else
      render :action => "tour_item"
    end
  end

  # GET /tours/1
  # GET /tours/1.xml
  def show
    @tour = Tour.find(params[:id])
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
    @tour = TourItem.where(:tour_id => params[:id])
    @t_name = Tour.find(params[:id]).name 
  end

  # POST /tours
  def create
    @tour = Tour.new(params[:tour])
    if @tour.save
      redirect_to(@tour, :notice => 'Tour was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /tours/1
  # PUT /tours/1.xml
  def update
    @tour = Tour.find(params[:id])
    if @tour.update_attributes(params[:tour])
      redirect_to(@tour, :notice => 'Tour was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.xml
  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to(tours_url)
  end
  
  def sort
    order = params[:item]
    TourItems.order(order)
    render :text => order.inspect
  end
end
