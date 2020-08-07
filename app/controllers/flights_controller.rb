class FlightsController < ApplicationController
    before_action { flash.clear }

    def index
        @flights = Flight.all
    end
    
    def new
        @flight = Flight.new
    end
    
    def create
        @flight = Flight.new(flight_params)
        if @flight.save
          redirect_to @flight
        else
          flash[:danger] = "Something went wrong"
          render 'new'
        end
    end
    
    def show
        @flight = Flight.select("flights.*, pilots.name as pilot_name, airlines.name as airline_name, aircrafts.registration")
                        .joins(:pilot, :airline, :aircraft)
                        .find(params[:id])
    end
    
    def edit
        @flight = Flight.find(params[:id])
    end
    
    def update
        @flight = Flight.find(params[:id])
        if @flight.update_attributes(flight_params)
          redirect_to @flight
        else
          flash[:danger] = "Something went wrong"
          render 'edit'
        end
    end
    
    def destroy
        @flight = Flight.find(params[:id])
        if @flight.destroy
            redirect_to flights_url
        else
            flash[:danger] = 'Something went wrong'
            redirect_to flights_url
        end
    end
    
    private

    def flight_params
        params.require(:flight).permit(:pilot_id, :airline_id, :aircraft_id, :flight_num, :start_time, 
                                       :end_time, :origin, :destination)
    end
end
