class Api::AddressesController < ApplicationController
    def index
        addresses = Address.where(user_id: current_user.id)
            if addresses.present?
                render json: {address: addresses, message: "prsent"}
            else
                render json: {address:"", message: "no addess prsent"}
            end
    end

    def create
        if current_user.present?
            address = Address.new(ads_params)
            if address.save
                render json: {address: address, message: "address created"}
            else
                render json: {address:"", message: "failed"}
            end
        end
    end

    def destroy
        if current_user.present?
            address = Address.find(params[:id])
            if address.destroy
                render json: {address: "", message: "address deleted"}
            else
                render json: {address:"", message: "failed"}
            end
        end
    end

    private

    def ads_params
        param = params.require(:address).permit(:name,:mobile,:pincode,:address,:locality,:city,:landmark,:alternate_mobile,:address_type)
        param["user_id"] = current_user.id
        param
    end
end
