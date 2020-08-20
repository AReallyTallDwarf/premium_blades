class BasketbladesController < ApplicationController

    def index
      @basketblades = current_user.basket.basketblades
    end

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

    # def destroy
    #   @basketblade = Basketblade.find(basketblade_params)
    #   if @basketblade.destroy
    #     flash[:success] = 'Basketblade was successfully deleted.'
    #     redirect_to basketblades_url
    #   else
    #     flash[:error] = 'Something went wrong'
    #     redirect_to basketblades_url
    #   end
    # end

    def checkout
      
      result = BladeServices::SubstractBasketbladeQuantityFromStock.new({current_user: current_user}).call
      if result && result.success?
        result2 = BasketbladeServices::DestroyCurrentUserBasketblades.new({current_user: current_user}).call
        if result2 && result2.success?
          redirect_to :root, :notice => "Checket out successfully! Thanks for your purchase!"
        else
          flash[:notice] = "Uh oh... Something went wrong..."
          flash[:notice] = result2.errors
          redirect_back fallback_location: root_path
        end
      else
        flash[:notice] = "Uh oh... Something went wrong..."
        flash[:notice] = result2.errors
        redirect_back fallback_location: root_path
      end

    end
    
    private
    def basketblade_params
        params.require('basketblade').permit(:basket, :blade, :quantity)
    end

end
