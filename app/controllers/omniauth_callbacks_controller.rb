class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    if user_signed_in? 
  		@user = User.from_omniauth_started(request.env["omniauth.auth"], current_user)
	else
    	@user = User.from_omniauth(request.env["omniauth.auth"])
    end

	if @user.persisted?
	  sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
	  set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
	else
	  session["devise.facebook_data"] = request.env["omniauth.auth"]
	  redirect_to new_user_registration_url
	end
	
  end

  def failure
    redirect_to root_path
  end
end