class MembersController < ApplicationController
    before_action :authenticate_user!

    def show
       
        render json: {
            message: "if you see this your in!",
            user: current_user
        }
    end
   
end