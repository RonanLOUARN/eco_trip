class TripsController < ApplicationController
  before_action :set_trip, only: %i(update destroy)

  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.new
    build_notice(@trip.state) if @trip.save
    respond_to(&:js)
  end

  def update
    build_notice(@trip.state) if @trip.started!
    respond_to(&:js)
  end

  def destroy
    build_notice(@trip.state) if @trip.canceled!
    respond_to(&:js)
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def build_notice(state)
    flash[:notice] = "Trip successfully #{state}"
  end
end
