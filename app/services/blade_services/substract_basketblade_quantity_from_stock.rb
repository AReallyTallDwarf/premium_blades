module BladeServices
    class SubstractBasketbladeQuantityFromStock

        require 'ostruct'

        def initialize(params)
            @current_user = params[:current_user]
        end

        def call
            
            # get all blades
            blades = Array.new
            basketblades = @current_user.basket.basketblades
            basketblades.each { |basketblade|
                blade = basketblade.blade
                blade.stock -= basketblade.quantity
                blades << blade
            }

            # # substract quantity from stock
            # blades.each do |blade|
            #     blade.stock -= basketblades.detect({ |basketblade| basketblade["blade"] == blade }).quantity
            # end
            puts blades.inspect
            # update all blades
            
            blades.each do |blade|
                blade.update({stock: blade.stock})
            end
            OpenStruct.new({success?: true})
            
            # if result
            #     OpenStruct({success?: true, payload: result})
            # else
            #     OpenStruct({success?: false, payload: result})
            # end
            
        end
        
    end
end