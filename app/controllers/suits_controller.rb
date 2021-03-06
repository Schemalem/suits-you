class SuitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @pagy, @suits = pagy(Suit.search_form(params[:query].order(name: :asc)), items: 15)
    else
      @pagy, @suits = pagy(Suit.all.order(name: :asc), items: 15)
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
