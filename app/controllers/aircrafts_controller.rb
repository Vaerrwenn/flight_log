class AircraftsController < ApplicationController
    def index
        @aircrafts = Aircraft.all.order(id: :asc)
    end
    
    def new
        @aircraft = Aircraft.new
    end
    
    def create
        @aircraft = Aircraft.new(aircraft_params)
        if @aircraft.save
          redirect_to @aircraft
        else
          flash[:danger] = "Something went wrong"
          render 'new'
        end
    end

    def show
        @aircraft = Aircraft.select("aircrafts.*, manufacturers.name")
                            .joins(:manufacturer)
                            .find(params[:id])
    end

    def edit
        @aircraft = Aircraft.find(params[:id])
    end

    def update
        @aircraft = Aircraft.find(params[:id])
        if @aircraft.update_attributes(aircraft_params)
          redirect_to @aircraft
        else
          flash[:danger] = "Something went wrong"
          render 'edit'
        end
    end
    
    def destroy
        @aircraft = Aircraft.find(params[:id])
        if @aircraft.destroy
            redirect_to aircrafts_url
        else
            flash[:danger] = 'Something went wrong'
            redirect_to aircrafts_url
        end
    end
    
    private

    def aircraft_params
        params.require(:aircraft).permit(:manufacturer_id, :registration, :model)
    end
end
