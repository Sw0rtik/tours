class CountriesController < ApplicationController
  def index
    @country = Country.all
  end

  def new
    @country = Country.new
  end

  def show
    @country = Country.find(params[:id])
    @region = @country.regions
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])

    if (@country.update(country_params))
      redirect_to @country
    else
      render 'edit'
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    redirect_to countries_path
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to @country
    else
      render 'new'
    end
  end

  public def country_params
    params.require(:country).permit(:name)
  end
end
