class BraintreeController < ApplicationController
  def new
  	@booking = Booking.find(params[:id])
  	# @braintree = @booking.braintree.new
  	@client_token = Braintree::ClientToken.generate
  end


  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    result = Braintree::Transaction.sale(
     :amount => "10.00", #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )


    @booking = Booking.find(params[:checkout_form][:booking_id])

    if result.success?
      @booking.transaction_id = result.transaction.id
      @booking.transaction_status = result.transaction.status
      @booking.fourdigits = result.transaction.credit_card_details.last_4
      @booking.save


      redirect_to listing_booking_path(@booking.listing,@booking), :flash => { :success => "Transaction successful!" }
    else
      redirect_to braintree_new_path, :flash => { :error => "Transaction failed. Please try again." }
    end 
  end

end