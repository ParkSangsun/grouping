class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]



  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  # included do
  #   before_filter :configure_permitted_parameters
  # end

  #protected
  
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :nickname
  # end

  
  #sign_up 이후 실행되어 station 정보 입력
  #protected
  def create
    build_resource
    super do |resource|
      if resource.save
        @a = User.find(resource.id)
        @a.first_station = params[:first_station].to_s
        @a.second_station = params[:second_station].to_s
        @a.save
      end
    end
  end
  
  
  
  #protected
  private

  def sign_up_params
    params.require(:user).permit(:nickname, :first_station, :second_station, :email, :password, :password_confirmation)
  end
  
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
