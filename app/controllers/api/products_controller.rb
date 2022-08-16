module Api
    class ProductsController < ApplicationController

        ALLOWED_DATA = %[name description price rating].freeze
        def index
            products = Product.all
            render json: products
        end
        
        def show 
            product = Product.find(params[:id])
            render json: product
        end

        def create
            data = json_payload.select {|k| ALLOWED_DATA.include?(k)}
            product = Product.new(data)
            if product.save
                render json: product
            else
                render json: {"error": "could not create it"}
            end
        end

        def destroy
            product = Product.find(params[:id])
            product.destroy
        end

    end
end

