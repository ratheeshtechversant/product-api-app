class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_params, only: [:create]
    respond_to :json
    private

    def respond_with(resource,_opts = {})
        register_success && return if resource.persisted?

        register_failed
    end

    def register_success
        render json: {
            message: "signed in successfully",
            user: current_user
        }, status: :ok
    end

    def register_failed
        render json: {
            message: "something went wrong"
        },status: :unprocessable_entity
    end

    def configure_sign_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
    end
end