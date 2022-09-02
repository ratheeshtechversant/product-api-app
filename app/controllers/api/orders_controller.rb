class Api::OrdersController < ApplicationController
    def index
        if Order.exists?(user_id: current_user.id)
            order = Order.where(user_id: current_user.id)
        else
            render json: {message: "order empty"}
        end
        render json: order
    end

    def show
        if Order.exists?(params[:id])
            order = Order.where("user_id = ? AND id = ?", current_user.id, params[:id])
        else
            render json: {message: "order empty"}
        end
        render json: order
    end

    def update
        order = Order.where("id = ? AND user_id = ?",params[:id],current_user.id)
        if order.update(status: "cancelled")
            render json:{message: "order cancelled"}
        else
            render json:{message: "order cancellation failed"}
        end
    end

    def create
        @order = Order.new(order_params)
        if @order.save

            cart = Cart.find_by(user_id:current_user.id)
            cart.cart_items.each do |x|
            @order.order_items.create(product_id:x.product_id,weight_type: x.weight_type, quantity:x.quantity)
            x.destroy
            end
            render json: {message: "order placed"}
        else
            render json: {message: "order failed"}
        end
    
    end
    def buynow
        order = Order.new(order_params)
        if order.save
            if order.order_items.create(order_item_params)
                render json: {message: "order placed"}
            else
                order.destroy
                render json: {message: "order failed"}
            end
        else
            render json: {message: "order failed"}
        end
        # render json: {message: order_item_params }

    end


    private
    def order_item_params
        params.require(:order).permit(:product_id,:quantity,:weight_type)
    end

    def order_params
        param = params.require(:order).permit(:total_amount,:tax,:total_to_pay,:status)
        param["user_id"] = current_user.id
        param
    end
    
end
