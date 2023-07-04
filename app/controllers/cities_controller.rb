class CitiesController < ApplicationController
  def index
    pp params
    @city = City.all
  end

  def new
    @regions_options = Region.all.map { |c| [c.name, c.id] }
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to @city
    else
      render 'new'
    end
  end

  def show
    @city = City.find(params[:id])
    @hhs = @city.holiday_houses
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])

    if (@city.update(city_params))
      redirect_to @city
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end

  private def city_params
    params.require(:city).permit(:name, :region_id, :id)
  end

end
