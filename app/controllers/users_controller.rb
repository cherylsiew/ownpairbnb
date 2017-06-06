class UsersController < Clearance::UsersController
	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			redirect_back_or url_after_create
		else
			@error_password = "Bad password"
		end
	end

	def update
		@user = User.find_by(user_params[:id])
    	@user.update(user_params)
    	if @user.save
 		root '/'
 		else
 		flash[:error] = "Update is unsuccessful"
		redirect_to edit_user_path
      	end
    end

	def edit
		@user = current_user
	end

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :phone, :avatar)
	end

end