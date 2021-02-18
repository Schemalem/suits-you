class SuitsController < ApplicationController
  def index
    if params[:query].present?
      @suits = Suit.search_form(params[:query])
    else 
      @suits = Suit.all
    end
  end

  def new
    @suit = Suit.new
  end

  def show
    @suit = Suit.find(params[:id])
  end

  def edit
    @suit = Suit.find(params[:id])
  end

  def update
    @suit = Suit.find(params[:id])
    if @suit.update(suit_params)
      redirect_to @suit, notice: 'Suit was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @suit = Suit.find(params[:id])
    @suit.destroy
    redirect_to suits_url, notice: 'Suit was successfully destroyed.'
  end

  def create
    @suit = Suit.new(suit_params)
    @suit.user = current_user
    if @suit.save!
      redirect_to suit_path(@suit)
    else
      render :new
    end
  end

  private

  def suit_params
    params.require(:suit).permit(:size, :colour, :style, :occasion, :price, :brand, :name, photos: [])
  end
end
