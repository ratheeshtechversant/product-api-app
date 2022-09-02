class Api::CartItemsController < ApplicationController
    def index
        cart= Cart.find_by(user_id: current_user.id)
        cart_item = CartItem.find_by(cart_id: cart.id)
        if cart.present?
            sql = "SELECT *,cart_items.id FROM cart_items INNER JOIN products  ON
                    cart_items.product_id = products.id AND cart_items.cart_id=#{cart.id}"
            carts =  ActiveRecord::Base.connection.execute(sql)
            render json: carts
        else
            render json: {message: "cart not present"}

        end

    end

    def destroy
        cart = CartItem.find(params[:id])
        if cart.destroy
            render json: {message: "delete successfull"}
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        
        if @cart_item.update(cart_update_params)
            render json: {message: "cart item updated"}
        end
      end

    def create
        if !CartItem.where("cart_id = ? and product_id = ?",cart_params[:cart_id],cart_params[:product_id]).exists?
            cart_item = CartItem.create(cart_params)
            render json: {message: "item added to cart"}
        else
            render json: {message: "alrady exist"},status: :ok

        end
        # render json: cart_params
    end


    private

    def cart_update_params
        params.require(:cart_items).permit(:quantity,:weight_type)

    end

    def cart_params
        params.require(:cart_items).permit(:cart_id,:product_id,:quantity,:weight_type)
    end
end
