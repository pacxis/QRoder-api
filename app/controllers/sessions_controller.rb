class SessionsController < ApplicationController

    def create
        puts params
        user = User.find_by(email: params[:email])
        if(user) then 
            render :json => user if user.valid_password?(params[:password])
        else
            render :json => nil
        end 
    end

    def new_user
        user = User.new()
        user.email = params[:email]
        user.password = params[:password]
        user.password_confirmation = params[:confirm]
        user.save
                
        cust = CustSession.new()
        cust.user_id = user.id 
        cust.table = params[:table].to_i
        cust.tell = "0412345678"
        if (user.save && cust.save) then 
            render :json => user 
        else
            render :json => {error: user.errors, sec: cust.errors}
        end 
        
        # binding.pry
        
        # cust = CustSession.new()
        # cust.user_id = user.id 
        # cust.table = params[:table]
        # cust.tell = "0412345678"
        # if (cust.save) then 
        #     render :json => user 
        # else
        #     render :json => {error: user.errors, sec: cust.errors}
        # end 
    end

    def destroy
        puts params
        user = User.find_by(id: params[:id])
        if(user) then 
            render :json => {user: "Logged out successfully"}
        else 
            render :json => {user: "User Does not exist"}
        end
    end
end
