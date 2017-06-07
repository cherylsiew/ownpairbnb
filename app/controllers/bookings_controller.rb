class BookingsController < ApplicationController
	def new
		@listing = Listing.find(params[:listing_id])
		@booking = @listing.bookings.new
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@total_price = (Date.strptime(params[:booking][:end_date], '%Y-%m-%d') - Date.strptime(params[:booking][:start_date], '%Y-%m-%d')).to_i * @listing.price_per_day 
		
		@listing = Listing.find(params[:listing_id])
		@booking = @listing.bookings.new(booking_params)
		#listing id will enter @booking object, so now i m left with the user_id
		@booking.user = current_user
		@booking.total_price = @total_price

		if @booking.save
      BookingJob.perform_now(current_user, @listing.user,@booking.id)
      # BookingMailer.booking_email(current_user, @listing.user, @booking.id).deliver_now

			redirect_to listing_booking_path(@listing,@booking) #@booking means booking show path, means show me this particular created booking
		else
			render "bookings/edit"
		end
	end

	def show
		@listing = Listing.find(params[:listing_id])
		@booking = Booking.find(params[:id])
	end
  	
  	def destroy
  	end

  	def index
  		@bookings = current_user.bookings
  	end

  	private
  	def booking_params
    	params.require(:booking).permit(:start_date, :end_date, :no_of_adults, :no_of_children)
	end
end