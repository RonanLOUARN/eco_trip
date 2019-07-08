class TripsController < ApplicationController
  before_action :set_trip, only: %i(create update destroy)

  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.new
    @trip.save
    respond_to(&:js)
  end

  def update
    @trip.started!
    respond_to(&:js)
  end

  def destroy
    @trip.canceled!
    respond_to(&:js)
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
