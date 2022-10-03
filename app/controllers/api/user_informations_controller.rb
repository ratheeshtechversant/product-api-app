class Api::UserInformationsController < ApplicationController
    def index
        user_info = UserInformation.where(user_id: current_user.id).first
        if user_info.present?
            render json: user_info
        else
            render json: {id: 0,first_name: "",last_name: "", gender: "", mobile:""}
        end
    end

    def create
        user_info = UserInformation.where(user_id: current_user.id).first
        if user_info.present?
            userInfo = user_info.update(info_update_params)
            if userInfo
                user_info1 = UserInformation.where(user_id: current_user.id).first
                render json: {userinfo: user_info1,message: "updated"}
            end
        else
            userInfo = UserInformation.create(info_params)
            render json: {userinfo: userInfo,message: "created"}
        end
    end

    private

    def info_params
        param = params.require(:user_information).permit(:first_name,:last_name,:gender,:mobile)
        param["user_id"] = current_user.id
        param
    end
    def info_update_params
        params.require(:user_information).permit(:first_name,:last_name,:gender,:mobile)
        
    end
end
