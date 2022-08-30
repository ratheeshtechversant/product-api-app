class Api::CartsController < ApplicationController
    def create
        if !Cart.exists?(user_id: cart_params[:user_id]) 
            @cart = Cart.create(user_id: cart_params[:user_id])
        else
            @cart = Cart.find_by(user_id:cart_params[:user_id])
        end
        if @cart.present?
            render json: @cart
        end
    
    end
        private

        def cart_params
            params.require(:cart).permit(:user_id)
        end
    
end
