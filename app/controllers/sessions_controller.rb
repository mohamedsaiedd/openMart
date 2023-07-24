class SessionsController < ApplicationController
    def destroy
        session[:user_id] = nil 
        redirect_to root_path , notice: "you are logged out"
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "logged in"
            
        else
            flash.now[:alert] = "Invaild Email or Password"
            render :new
        end
    end
    def new
        
    end
end
