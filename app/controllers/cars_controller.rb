class CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  # GET /cars
  def index
    @cars = Car.all
    render json: @cars
  end

  # GET /cars/1
  def show
    @car = Car.find(params[:id])
    render json: Car.find(@car.id)
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    if @car.save
      render json: 'Car created successfully'
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      render json: 'Car updated successfully'
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    render json: 'Car deleted successfully'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:name, :model, :description, :car_image_url, :rating, :price, :rent_per_day, :user_id)
  end
end
