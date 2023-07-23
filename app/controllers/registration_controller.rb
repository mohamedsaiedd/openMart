class RegistrationController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            flash.now[:notice] = "Successfuly created account!"
            redirect_to root_path 
        else
            render :new 
        end    
    end    

    def user_params
        #security upcoming
        params.require(:user).permit(:email, :password, :password_confirmation)
    end   
end