module BasketbladeServices
    class DestroyCurrentUserBasketblades
        def initialize(params)
            @current_user = params[:current_user]
        end

        def call

            # Destroy basketblades from the current user

            destroyed_basketblades = @current_user.basket.basketblades.destroy_all

            if destroyed_basketblades
                OpenStruct.new({ success?: true, payload: destroyed_basketblades })
            else
                OpenStruct.new({ success?: false, payload: destroyed_basketblades.error })
            end
    
        end
        
    end
end