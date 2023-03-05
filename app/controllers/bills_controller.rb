class BillsController < ApplicationController
    def index
        # Display a list of all Bills
        @bills = Bill.includes(:bill_products)
        render json: @bills
      end
    
      def show
        # Display a specific Bill
        @bill = Bill.find(params[:id])
        render json: @bill
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
        @bill = Bill.find(params[:id])
        @bill.destroy
        head :no_content
      end
    
      private
    
      def bill_params
        params.require(:bill).permit(:total_before_discount, :total_dicount_percentage, :total_discount_value,
           :total_after_discount, :paied, :date, :left, :debit, :total_debit, :customer_id)
      end
end
