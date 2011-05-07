class ExhibitionsController < CmsapplicationController
  # GET /exhibitions
  def index
    @exhibitions = Exhibition.paginate(:page => params[:page], :per_page=>20)
  end

  # GET /exhibitions/1
  def show
    @exhibition = Exhibition.find(params[:id])
  end

  # GET /exhibitions/new
  def new
    @exhibition = Exhibition.new
  end

  # GET /exhibitions/1/edit
  def edit
    @exhibition = Exhibition.find(params[:id])
  end

  # POST /exhibitions
  def create
    @exhibition = Exhibition.new(params[:exhibition])
    if @exhibition.save
      redirect_to(@exhibition, :notice => 'Exhibition was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /exhibitions/1
  def update
    @exhibition = Exhibition.find(params[:id])

    if @exhibition.update_attributes(params[:exhibition])
      redirect_to(@exhibition, :notice => 'Exhibition was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /exhibitions/1
  def destroy
    @exhibition = Exhibition.find(params[:id])
    @exhibition.destroy

    redirect_to(exhibitions_url)
  end
end
