class BillProductsController < ApplicationController
    def index
        # Display a list of all BillProducts
        @bill_products = BillProduct.all
        render json: @bill_products
      end
    
      def show
        # Display a specific BillProduct
        @bill_product = BillProduct.find(params[:id])
        render json: @bill_product
      end
    
      def create
        # Save a new BillProduct to the database
        @bill_product = BillProduct.new(bill_product_params)
        if @bill_product.save
          render json: @bill_product, status: :created
        else
          render json: @bill_product.errors, status: :unprocessable_entity
        end
      end
    
      def update
        # Update a specific BillProduct in the database
        @bill_product = BillProduct.find(params[:id])
        if @bill_product.update(bill_product_params)
          render json: @bill_product
        else
          render json: @bill_product.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        # Delete a specific BillProduct from the database
        @bill_product = BillProduct.find(params[:id])
        @bill_product.destroy
        head :no_content
      end
    
      private
    
      def bill_product_params
        params.require(:bill_product).permit(:product_id, :bill_id, :price, :discount, :quantity, :total_price)
      end
end
