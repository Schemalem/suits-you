class SuitsController < ApplicationController
    def index
     @suits = Suit.all
    end 

    def new
     @suit = Suit.new
    end 
    
    def show 
     @suit = Suit.find(params[:id])
    end

    def create
      @suit = Suit.new(suit_params)
      @suit.user = current_user
      if @suit.save
        redirect_to suit_path(@suit)
      else 
        render :new
      end
    end 

    private

    def suit_params
      params.require(:suit).permit(:size, :colour, :style, :occasion, :price)
    end
end
