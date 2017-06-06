class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update]
  
  def index
    # @listings = Listing.page(params[:page]).order('created_at DESC').per_page(10)

    @listings = Listing.order(:created_at).page(params[:page]).per(10)
    # @listings = Listing.order(:Property_Type).page(params[:page])
  end

  def show
  end

  def create
		@listing = current_user.listings.new(listing_params)
    #@listing = Listing.new(listing_params)
    # @listing.user = current_user
		if @listing.save
			redirect_to listings_path
		else
			flash[:error] = "City, Postcode, State, Country and Currency cannot be blank!"
			redirect_to new_listing_path
		end
  end

  def new
  	@listing = Listing.new
  end

  def edit
    # @listing = Listing.find(params[:id])
  end

  def update
    # @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    if current_user.superadmin? || current_user.moderator?
      if @listing.verification == false
        @listing.verification = true
        @listing.save
      end
    end

    redirect_to listings_path
  end

private
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:address1, :address2, :postcode, :country, :currency, :no_of_rooms, :no_of_beds, :no_of_bathrooms, :price_per_day, :price_per_week, :price_per_calendar_month, :islands, :smoking?, :Property_Name, :Property_Type, {photos: []})
  end
end
  