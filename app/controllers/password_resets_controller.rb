class PasswordResetsController < ApplicationController

    def new
    end

    def create 
        @user = User.find_by(email:params[:email])

        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
        end

        redirect_to root_path , notice: "if your account was found , we have sent reet email to your email box !"
    end

    def edit 
        @user = User.find_signed(params[:token])
    end

    def update 
        @user = User.find_signed(params[:token])
        if @user.update(password_params)
            redirect_to log_in_path , notice: "your password updated successfuly!"
        else
            render :edit
        end 
    end

    private

    def  password_params 
        params.require(:user).permit(:password , :password_confirmation)
    end


end