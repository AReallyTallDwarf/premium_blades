class CatalogueBladeController < ApplicationController

    def new
        @catalogue_blade = CatalogueBlade.new
    end
    
    def create
        @catalogue_blade = CatalogueBlade.new(catalogue_blade_params)
        
        if @catalogue_blade.save
          flash[:success] = "CatalogueBlade successfully created"
          redirect_to @catalogue_blade
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private
    def catalogue_blade_params
        params.require(:catalogue_blade).permit(:catalogue, :blade, :quantity)
    end

end
