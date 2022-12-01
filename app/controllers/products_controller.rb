class ProductsController < ApplicationController
    # before_action :employee_only,except: %i[destroy edit]

    def index 
        @deserts = Product.where(category: "deserts").with_attached_image
        @starters = Product.where(category: "starters").with_attached_image
        @mains = Product.where(category: "main").with_attached_image
        @drinks = Product.where(category: "drinks").with_attached_image

        @drinks = @drinks.map { |drink|
            drink.as_json.merge({ image: drink.image.attached? ? url_for(drink.image) : ""})
            }
        @starters = @starters.map { |starter|
            starter.as_json.merge({ image: starter.image.attached? ?  url_for(starter.image) : "" })
            }
        @mains = @mains.map { |main|
            main.as_json.merge({ image: main.image.attached? ? url_for(main.image) : "" })
            }
        @deserts = @deserts.map { |desert|
            desert.as_json.merge({ image: desert.image.attached? ? url_for(desert.image) : ""})
            }
        render :json => [@deserts, @starters, @mains, @drinks]
        
        # render json: [ProductSerializer.new(@deserts),ProductSerializer.new(@starters),ProductSerializer.new(@mains),ProductSerializer.new(@drinks)]
        # respond_to do |format|
        #     format.html
        #     format.json  { render :json => @mains }
        # end
    end

    def destroy
        @product = Product.find_by(id: params[:id])
        @product.destroy
        @deserts = Product.where(category: "deserts").with_attached_image
        @starters = Product.where(category: "starters").with_attached_image
        @mains = Product.where(category: "main").with_attached_image
        @drinks = Product.where(category: "drinks").with_attached_image

        @drinks = @drinks.map { |drink|
            drink.as_json.merge({ image: drink.image.attached? ? url_for(drink.image) : ""})
            }
        @starters = @starters.map { |starter|
            starter.as_json.merge({ image: starter.image.attached? ?  url_for(starter.image) : "" })
            }
        @mains = @mains.map { |main|
            main.as_json.merge({ image: main.image.attached? ? url_for(main.image) : "" })
            }
        @deserts = @deserts.map { |desert|
            desert.as_json.merge({ image: desert.image.attached? ? url_for(desert.image) : ""})
            }
        render :json => [@deserts, @starters, @mains, @drinks]
    end

    def edit
        @product = Product.find_by(id: params[:id])
    end

    def update
        @product = Product.find_by(id: params[:id])
        @product.update(name: params[:name], description: params[:description], price: params[:price], category: params[:category])
        @product.image = params[:image] if params[:image]
        @product.save
        render :json => @product
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new
        @product.update(name: params[:name], description: params[:description], price: params[:price],image: params[:image],category: params[:category])
        # redirect_to root_path(), :notice => "Product Created."
        render :json => @product
    end

    def show
        puts params
        puts "^^^^^^^^^^^^^^^^^^^^"
        product = Product.find_by(id: params[:id])
        render :json => product
    end

    private

    def employee_only
        unless !current_user or  current_user.role == 'customer'
          redirect_to orders_path(), :alert => "Access denied."
        end
    end
end
