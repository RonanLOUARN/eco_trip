require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  describe "GET index" do
    it "assigns @trips" do
      tripe = Trip.create
      get :index
      expect(assigns(:trips)).to eq([tripe])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    it "assigns @trip" do
      post :create, as: :js
      expect(assigns(:trip)).to be
    end

    it "renders the create js template" do
      post :create, as: :js
      expect(response).to render_template("create")
    end
  end

  describe "PATCH update" do
    it "assigns @trip" do
      tripe = Trip.create
      patch :update, params: {id: tripe.id}, as: :js
      expect(assigns(:trip)).to be
      expect(assigns(:trip).state).to eq('started')
    end

    it "renders the update js template" do
      tripe = Trip.create
      patch :update, params: {id: tripe.id}, as: :js
      expect(response).to render_template("update")
    end
  end

  describe "DELETE update" do
    it "assigns @trip" do
      tripe = Trip.create
      patch :destroy, params: {id: tripe.id}, as: :js
      expect(assigns(:trip)).to be
      expect(assigns(:trip).state).to eq('canceled')
    end

    it "renders the destroy js template" do
      tripe = Trip.create
      patch :destroy, params: {id: tripe.id}, as: :js
      expect(response).to render_template("destroy")
    end
  end
end
