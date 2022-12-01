class OrdersController < ApplicationController
    # before_action :employee_only,except: :create


    def index
        @orders = Order.where(status: :pending)
    end

    def update
        @order = Order.find(params[:id])
        @order.update(status: params[:order][:status])
        @order.save
        redirect_to orders_path(), :notice => "Updated successfully"
    end
    
    def show
        @order = Order.find_by(id: params[:id])
    end

    def edit
        @order = Order.find_by(id: params[:id])
    end

    def mark_complete
        @order = Order.find_by(id: params[:id])
        @order.update(status: "prepared")
        @order.save
        # redirect_to orders_path(), :notice => "Updated successfully"
        @orders = Order.where(status: :pending).or(Order.where(id: params[:id]))
        render :json => @orders
    end

    def create
        @cart = Cart.find_by(user_id: params[:user_id])
        if(@cart) then
            if(@cart.products.length > 0) then
                @order = Order.new(user_id: @cart.user_id, products: @cart.products, status: :pending,comment: params[:comments], tell: User.find_by(id: params[:user_id]).cust_session.tell, table: User.find_by(id: params[:user_id]).cust_session.table,quantity: @cart.quantity)
                @order.save
                @cart.destroy
            end
        end
        render :json => @order
    end

    def delete_all_orders
        @orders = Order.where(status: :prepared)
        if(@orders) then 
            puts @orders.destroy_all
        else
        end
        render :json => {messege: "All orders deleated"}
    end

    private
    def employee_only
        unless current_user.role == 'employee'
          redirect_to current_orders_path(), :alert => "Access denied."
        end
    end
end
