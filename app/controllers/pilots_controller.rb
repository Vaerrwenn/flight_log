class PilotsController < ApplicationController
    before_action { flash.clear }

    def index
        @pilots = Pilot.all.order(id: :asc)
    end
    
    def new
        @pilot = Pilot.new
    end
    
    def create
        @pilot = Pilot.new(pilot_params)
        if @pilot.save
          redirect_to @pilot
        else
          flash[:danger] = "Data could not be saved. Please check the form again and fill all the required fields."
          render 'new'
        end
    end

    def show
        @pilot = Pilot.find(params[:id])
    end

    def edit
        @pilot = Pilot.find(params[:id])
    end
    
    def update
        @pilot = Pilot.find(params[:id])
        if @pilot.update_attributes(pilot_params)
          redirect_to @pilot
        else
          flash[:danger] = "Data couldn't be saved. Please check the form again."
          render 'edit'
        end
    end
    
    def destroy
        @pilot = Pilot.find(params[:id])
        if @pilot.destroy
            redirect_to pilots_url
        else
            flash[:error] = "Data couldn't be deleted."
            redirect_to pilots_url
        end
    end
    

    private

    def pilot_params
        params.require(:pilot).permit(:name, :date_of_birth, :gender)
    end
    
    
end
