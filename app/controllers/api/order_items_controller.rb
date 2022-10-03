class Api::OrderItemsController < ApplicationController
    def index
    end
    def show
        order = Order.find(params[:id])
        if order.present?
            product1=[]
            order_items = OrderItem.where(order_id: order.id)
            order_items.each do |x|
                product = Product.find(x.product_id)
                prod = ProductSerializer.new(product).serializable_hash[:data][:attributes]
                # puts prod
                product1.push({order_item: x,order_product: prod})
            end 
            # sql = "SELECT *,order_items.id FROM order_items INNER JOIN products  ON
            #         order_items.product_id = products.id AND order_items.order_id=#{order.id} "
            # orderitemdetails =  ActiveRecord::Base.connection.execute(sql)
            # render json: orderitemdetails
            render json: {message: "present",orderItem: product1}

        else
            render json: {message: "cart not present"}

        end
    end
end
