class ProductsController < ApplicationController
    def index
        # Display a list of all Products
        @products = Product.all
        render json: @products
      end
    
      def show
        # Display a specific Product
        @product = Product.find(params[:id])
        render json: @product
      end
    
      def create
        # Save a new Product to the database
        @product = Product.new(product_params)
        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    
      def update
        # Update a specific Product in the database
        @product = Product.find(params[:id])
        if @product.update(product_params)
          render json: {status: 201, massage: "product updated successfully"}
        else
          render json: {status: 201, massage: "product is not updated "}
          head :no_content
        end
      end
    
      def destroy
        # Delete a specific Product from the database
        @product = Product.find(params[:id])
        if @product.destroy
          render json: {status: 201, massage: "product removed successfully"}
        else
          render json: {status: 201, massage: "product is not removed "}
          head :no_content
        end 
      end
    
      private
    
      def product_params
        params.require(:product).permit(:name, :description, :price, :quantity, :desired_quantity, :category_id)
      end
end
