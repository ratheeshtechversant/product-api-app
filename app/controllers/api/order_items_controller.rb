class Api::OrderItemsController < ApplicationController
    def index
    end
    def show
        order = Order.find(params[:id])
        order_items = OrderItem.where(order_id: order.id)
        if order.present?
            sql = "SELECT *,order_items.id FROM order_items INNER JOIN products  ON
                    order_items.product_id = products.id AND order_items.order_id=#{order.id} "
            orderitemdetails =  ActiveRecord::Base.connection.execute(sql)
            render json: orderitemdetails
            # render json: {message: "present"}

        else
            render json: {message: "cart not present"}

        end
    end
end
