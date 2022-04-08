class UsersController < ApplicationController
  	before_action :authenticate
	before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
	before_action :correct_user, only: [:show, :edit, :update]
	before_action :admin_user, only: :destroy
	# admin should be able to see all users

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(user_params) #Not final implementation
  		if @user.save
  			log_in @user
  			flash[:success] = "Welcome to Dispatch"
  			redirect_to incidents_path
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
  			# Handle a successful update
  			flash[:success] = "Your changes have been saved"
  			redirect_to @user
  		else
  			render 'edit'
  		end
  	end

  	def correct_user
  		logger.debug "in correct user"
  		@user = User.find_by_id(params[:id])
  		
  		
  		if @user.nil?
  			redirect_to incidents_path
  			
  		elsif current_user?(@user)
  			render 'show'
  		else
  			redirect_to incidents_path
  		end
  	end

  	def destroy
  		User.find(params[:id]).destroy
  		flash[:success] = "User deleted"
  		redirect_to users_url
  	end

  	def admin_user
  		redirect_to(incidents_path) unless current_user.admin?
  	end

  	private 

	  	def user_params
	  		params.require(:user).permit(:first_name, :last_name, :email, 
	  			             :phone_number, :password, :password_confirmation)
	  	end

	  	def logged_in_user
	  		unless logged_in?
	  			store_location
	  			flash[:danger] = "Please log in."
	  			redirect_to login_url
	  		end
	  	end
end
