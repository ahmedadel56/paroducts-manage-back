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
        @bill_product = BillProduct.where(remove_bill_products_params).first
        if @bill_product.destroy
          render json: {status: 201, massage: "Bill Item successfully removed"}
        else
          render json: {status:400, massage: "something went wrong"}
        end
      end
    
      private
    
      def bill_product_params
        params.require(:bill_product).permit(:product_id, :bill_id, :price, :discount, :quantity, :total_price)
      end
      def remove_bill_products_params
        { product_id: params[:product_id], bill_id: params[:bill_id] }
      end
end
