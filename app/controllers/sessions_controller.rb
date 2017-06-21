class SessionsController < ApplicationController
  
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		if @user.activated?
        #Log the user in and redirect to the user's show page
    		log_in @user
        #Code pour se rappeler de l'utilisateur si la checkbox est cochée
        params[:session][:remember_me]=='1' ? remember(@user) : forget(@user)
    		redirect_back_or @user
      else
        message = "Compte non activé. "
        message += "Vérifier vos emails pour le lien"
        flash[:warning] = message
        redirect_to root_url
      end
  	else
  		#Create an error message
  		flash.now[:danger] = 'Invalid email/password combination' 
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
