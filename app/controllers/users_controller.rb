class UsersController < ApplicationController
  #Pour être sur que seulement les utilisateurs log in peuvent modifier les infos
  before_action :logged_in_user,  only: [:index, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: :destroy

  def index
    @users =User.where(activated: true).paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)  # Pas la dernière implementation
  	if @user.save
      @user.send_activation_email
  		flash[:info] = "Veuillez vérifier vos emails pour activer le compte"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user 
      # handle a successful update
    else
      render 'edit'
    end
  end

    #Permet de détruire un user
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    #Confirme que c'est le bon utilisateur
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


    #Confirme qu'il s'agit d'un utilisateur administrateur
    def admin_user
      redirect_to(root_url) unless  current_user.admin?    
    end
end
