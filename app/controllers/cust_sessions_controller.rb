class CustSessionsController < ApplicationController

    def new 
        @cust = CustSession.new
    end

    def create
        @cust = CustSession.new()
        @cust.tell = params[:cust_session][:tell]
        @cust.table = params[:cust_session][:table]
        @cust.user_id = current_user.id

        if(@cust.valid?) then 
            @cust.save
            redirect_to root_path, :notice => "Session Created successfully"
        else 
            redirect_to new_cust_sessions_path, :alert => "You entered Wrong values"
        end

    end

    def destroy
        @cust = CustSession.find_by(id: current_user.cust_session.id)
        @cust.destroy
        redirect_to root_path, :notice => "Session Destroied successfully"
    end
end
