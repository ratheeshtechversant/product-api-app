module Api
    class ProductsController < ApplicationController

        def index
        
            products = Product.all
            render json: ProductSerializer.new(products).serializable_hash[:data]
            # ProductSerializer.new(products).serializable_hash[:data][:attributes]
        end
        
        # def show 
        #     product = Product.find(params[:id])
        #     render json: product
        # end

        def create
            product = Product.new(product_params)
            if product.save
                render json: product
            else
                render json: {"error": "could not create it"}
            end
        end

        # def destroy
        #     product = Product.find(params[:id])
        #     product.destroy
        # end
        def product_params
            params.require(:product).permit(:name,:description,:price,:rating,:image)
        end
    end
end

