
class AttractionsController < ApplicationController
    
    def index 
        @attractions = Attraction.all
        @user = current_user
    end

    def show 
        @attraction = Attraction.find(params[:id])
        @user = current_user
    end

    def new 
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit 
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def ride 
        @attraction = Attraction.find(params[:id])
        @user = current_user
        @ride = Ride.new 
        @ride.user = @user 
        @ride.attraction = @attraction 
        @ride.save
        @ride.take_ride
        flash[:notice] = @ride.flash_notice
        redirect_to user_path(@user)
    end

    private 

    def current_user
        User.find(session[:user_id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :happiness_rating, :min_height, :nausea_rating)
    end
end
