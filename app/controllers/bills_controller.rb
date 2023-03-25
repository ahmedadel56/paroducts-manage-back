class BillsController < ApplicationController
      def index
        # Display a list of all Bills
        @bills = Bill.where(date: params[:date])
        
        render json: @bills
      end
  
      def show
        # Display a specific Bill
        @bill = Bill.includes(:customer, :bill_products => :product).find(params[:id])
      
        # Check if the date is found
        if @bill.created_at.present?
          render json: {
            bill: @bill,
            status: 201
          } else
          render json: { error: 'Date not found', status: 404 }
        end
      end
    
      def create
        # Save a new Bill to the database
        @bill = Bill.new
        if @bill.save
          render json: {status:201, id: @bill.id}
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end
    
      def update
        # Update a specific Bill in the database
        @bill = Bill.find(params[:id])
        if @bill.update(bill_params)
          render json: @bill
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        # Delete a specific Bill from the database
        @bill = Bill.includes(:customer, :bill_products).find(params[:id])
        @customer = @bill.customer

        # Loop through all the bill_products associated with the bill
        @bill.bill_products.each do |bill_product|
          # Update the product quantity
          product = bill_product.product
          product.quantity += bill_product.quantity
          product.save
        end
        if @bill.destroy
          @customer.update(total_debits: @customer.total_debits - @bill.left)
        end
      end
    
      private
    
      def bill_params
        params.require(:bill).permit(:total_before_discount, :total_dicount_percentage, :total_discount_value,
           :total_after_discount, :paied, :date, :left, :debit, :total_debit, :customer_id)
      end
end
