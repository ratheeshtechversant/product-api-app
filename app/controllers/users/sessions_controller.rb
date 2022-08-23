class Users::SessionsController < Devise::SessionsController

    respond_to :json
    private

    def respond_with(resource,_opts = {})
        # puts "--------------------------------------"
        # puts "#{UserSerializer.new(resource).serializable_hash[:data][:attributes]}"
        # puts "#{resource.to_json(include: [:image])}"
        # puts "--------------------------------------"
        render json: {
            message: "you are logged in",
            user: current_user,
            image_url: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }, status: :ok
    end

    def respond_to_on_destroy
        log_out_success && return if current_user

        log_out_failure
    end

    def log_out_success
        render json: {
            message: "you are logged out"
        },status: :ok
    end

    def log_out_failure
        render json: {
            message: "nothing happended"
        },status: :unautherized
    end

    
end