class ManufacturersController < ApplicationController
    before_action { flash.clear }

    def index
        @manufacturers = Manufacturer.all.order(id: :asc)
    end
    
    def new
        @manufacturer = Manufacturer.new
    end
    
    def create
        @manufacturer = Manufacturer.new(manufacturer_params)
        if @manufacturer.save
          redirect_to manufacturers_path
        else
          flash[:danger] = "Manufacturer data could not be saved! Please check the errors on the form!"
          render 'new'
        end
    end

    def edit
        @manufacturer = Manufacturer.find(params[:id])
    end
    
    def update
        @manufacturer = Manufacturer.find(params[:id])
        if @manufacturer.update_attributes(manufacturer_params)
          redirect_to manufacturers_path
        else
          flash[:danger] = "Something went wrong."
          render 'edit'
        end
    end

    def destroy
        @manufacturer = Manufacturer.find(params[:id])
        if @manufacturer.destroy
            redirect_to manufacturers_url
        else
            flash[:danger] = "Something went wrong."
            redirect_to manufacturers_url
        end
    end
    
    
    private 

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end
    
end
