class AirlinesController < ApplicationController
    before_action { flash.clear }

    def index
        @airlines = Airline.all.order(id: :desc)
    end
    
    def new
        @airline = Airline.new
    end
    
    def create
        @airline = Airline.new(airline_params)
        if @airline.save
          redirect_to @airline
        else
          flash[:danger] = "Airline data could not be saved! Please check any error in the form."
          render 'new'
        end
    end

    def show
        @airline = Airline.find(params[:id])
    end
    
    def edit
        @airline = Airline.find(params[:id])
    end

    def update
        @airline = Airline.find(params[:id])
        if @airline.update_attributes(airline_params)
          redirect_to @airline
        else
          flash[:danger] = "Airline data could not be saved! Please check any error in the form."
          render 'edit'
        end
    end
    
    def destroy
        @airline = Airline.find(params[:id])
        if @airline.destroy
            redirect_to airlines_url
        else
            flash[:danger] = "Airline data could not be deleted!"
            redirect_to airlines_url
        end
    end
    
    private
    
    def airline_params
        params.require(:airline).permit(:name, :icao_code)
    end

end
