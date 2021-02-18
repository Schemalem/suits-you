class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @suit = Suit.find(params[:suit_id])
  end

  def create
    @suit = Suit.find(params[:suit_id])
    @booking = Booking.new(booking_params_new)
    @booking.user = current_user
    @booking.suit = @suit
    @booking.total_cost = (@booking.end_date - @booking.start_date).to_i * @suit.price
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to booking_path(@booking), notice: "Booking was updated"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path, notice: "Booking was destroyed"
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
    #remove :status permit, as it should be defaulted to "ordered"
  end

  def booking_params_new
    params.require(:booking).permit(:start_date, :end_date)
  end
end
