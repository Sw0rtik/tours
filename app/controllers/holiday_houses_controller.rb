class HolidayHousesController < ApplicationController
  def index
    pp params
    @hhs = HolidayHouse.all
  end

  def new
    @cities_options = City.all.map { |c| [c.name, c.id] }
    @hhs = HolidayHouse.new
  end

  def create
    @hhs = HolidayHouse.new(hh_params)

    if @hhs.save
      redirect_to @hhs
    else
      render 'new'
    end
  end

  def show
    @hhs = HolidayHouse.find(params[:id])
  end

  def edit
    @hhs = HolidayHouse.find(params[:id])
  end

  def update
    @hhs = HolidayHouse.find(params[:id])

    if (@hhs.update(hh_params))
      redirect_to @hhs
    else
      render 'edit'
    end
  end

  def destroy
    @hhs = HolidayHouse.find(params[:id])
    @hhs.destroy
    redirect_to holiday_houses_path
  end

  private def hh_params
    params.require(:holiday_house).permit(:name, :city_id, :id)
  end
end
