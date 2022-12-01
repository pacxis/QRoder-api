class CartsController < ApplicationController

    before_action :employee_only,except: :history

    def new
        @cart = Cart.find_by(user_id: params[:user_id])
        if(@cart) then 
            if @cart.products.include?(params[:product_id].to_i) then 
                i = @cart.products.find_index(params[:product_id].to_i)
                @cart.quantity[i] = @cart.quantity[i] + 1 
            else
                @cart.products = @cart.products.append(params[:product_id])
                @cart.quantity = @cart.quantity.append(1)
            end
        else
            @cart = Cart.new
            @cart.user_id = params[:user_id]
            @cart.products = [params[:product_id]]
            @cart.quantity = [1]
        end
        @cart.save
        render :json => [@cart]
    end

    def show
        # @cart = Cart.find_by(user_id: current_user)
        @cart = Cart.find_by(user_id: params[:user_id])
        @products = @cart ? Product.where(id: [@cart.products]) : Product.where(id: [])
        # @order = Order.new
        render :json => [@cart,@products]
    end

    def edit
        @cart = Cart.find_by(user_id: params[:user_id])
        if(@cart) then 
            if @cart.products.include?(params[:product_id].to_i) then 
                i = @cart.products.find_index(params[:product_id].to_i)
                if(@cart.quantity[i]>1) then 
                    @cart.quantity[i] = @cart.quantity[i] -1 
                else 
                    @cart.products.delete(params[:product_id].to_i)
                    @cart.quantity.delete_at(i)
                end
            end
        end
        @cart.save
        @products = @cart ? Product.where(id: [@cart.products]) : Product.where(id: [])
        render :json => [@cart,@products]
    end

    def checkout
    end

    def history
        orders = Order.where(status: :prepared)
        products_arr = []
        orders.each do |order| 
            products_arr.append(order.products)
        end 
        product = Product.where(id: products_arr.flatten())
        render :json => [orders,product]
    end

    def current
        user = User.find(params[:user_id])
        if (user.role == "customer") then 
            orders = Order.where(user_id: user.id, status: :pending)
            products_arr = []
            orders.each do |order| 
                products_arr.append(order.products)
            end 
            product = Product.where(id: products_arr.flatten())
            render :json => [orders,product]
        else 
            orders = Order.where(status: :pending)
            products_arr = []
            orders.each do |order| 
                products_arr.append(order.products)
            end 
            product = Product.where(id: products_arr.flatten())
            render :json => [orders,product]
        end 
        # if(current_user.role == "customer") then
        #     @carts = Order.where(user_id: current_user, status: :pending)
        # else
        #     @carts = Order.where(status: :pending)
        # end
    end

    def increase_quantity
        if(current_user) then
            if(current_user.cust_session) then 
                @cart = Cart.find_by(user_id: current_user)
                if(@cart) then 
                    if @cart.products.include?(params[:product_id].to_i) then 
                        i = @cart.products.find_index(params[:product_id].to_i)
                        @cart.quantity[i] = @cart.quantity[i] + 1 
                    else
                        @cart.products = @cart.products.append(params[:product_id])
                        @cart.quantity = @cart.quantity.append(1)
                    end
                else
                    @cart = Cart.new
                    @cart.user_id = current_user.id
                    @cart.products = [params[:product_id]]
                    @cart.quantity = [1]
                end
                @cart.save
                redirect_to carts_path,:notice => "Updated successfully"
            else 
                redirect_to new_cust_sessions_url
            end
        else
            redirect_to new_user_session_path
        end
    end

    private
    def employee_only
        unless !current_user or  current_user.role == 'customer'
          redirect_to orders_path(), :alert => "Access denied."
        end
    end
end