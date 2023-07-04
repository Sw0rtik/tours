class RegionsController < ApplicationController
  def index
    pp params
    @region = Region.all
  end

  def new
    @countries_options = Country.all.map { |c| [c.name, c.id] }
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to @region
    else
      render 'new'
    end
  end

  def show
    @region = Region.find(params[:id])
    @city = @region.cities
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])

    if (@region.update(region_params))
      redirect_to @region
    else
      render 'edit'
    end
  end

  def destroy
    @tbase = Region.find(params[:id])
    @region.destroy
    redirect_to regions_path
  end

  private def region_params
    params.require(:region).permit(:name, :country_id, :id)
  end
end
