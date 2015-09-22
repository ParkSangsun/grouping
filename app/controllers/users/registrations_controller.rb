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
      #if params[:first_station] == params[:second_station]
      #   :notice
      # end
      if resource.save
        @a = User.find(resource.id)
        @a.first_station = params[:first_station]
        @a.second_station = params[:second_station]
        #[@a.first_station, @a.second_station].each do |x|
        if params[:first_station] == ""
          @a.first_station = nil
        end
        if params[:second_station] == ""
          @a.second_station = nil
        end

        #@a.user_interest = params[:interest]
        # params[:interest].each do |x|
        #   unless x == nil
        #     @a.user_interest << parmas[:interest]
        #   end
        # end
        
        # @arr_interest = Array.new
        # @arr_interest << params[:interest_1], params[:interest_2], params[:interest_3], params[:interest_4]
        # @a.user_interest = @arr_interest
        @a.user_interest = params[:interest]
        @a.save
      end
    end
  end
  
  
  
  
  #protected
  private

  def sign_up_params
    params.require(:user).permit(:introduce, :major, :user_interest, :nickname, :first_station, :second_station, :email, :password, :password_confirmation)
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
