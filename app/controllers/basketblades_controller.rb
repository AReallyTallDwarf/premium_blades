class BasketbladesController < ApplicationController

    def new
        @basketblade = Basketblade.new
    end

    def create
        @basketblade = Basketblade.new({basket:current_user.basket, blade:Blade.find(basketblade_params[:blade]), quantity:basketblade_params[:quantity]})
        if @basketblade.save
          flash[:notice] = "Blade successfully added to your basket"
          redirect_back fallback_location: root_path
        else
          flash[:notice] = "Uh oh... Something went wrong..."
          flash[:notice] = @basketblade.errors
          redirect_back fallback_location: root_path
        end
    end
    
    private
    def basketblade_params
        params.require('basketblade').permit(:basket, :blade, :quantity)
    end

end
