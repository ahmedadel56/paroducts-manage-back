class CustomersController < ApplicationController
    def index
        # Display a list of all Customers
        @customers = Customer.all
      end
    
      def show
        # Display a specific Customer
        @customer = Customer.find(params[:id])
      end
    
      def new
        # Display a form to create a new Customer
        @customer = Customer.new
      end
    
      def create
        # Save a new Customer to the database
        @customer = Customer.new(customer_params)
        if @customer.save
          redirect_to customer_path(@customer)
        else
          render :new
        end
      end
    
      def edit
        # Display a form to edit a specific Customer
        @customer = Customer.find(params[:id])
      end
    
      def update
        # Update a specific Customer in the database
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
          redirect_to customer_path(@customer)
        else
          render :edit
        end
      end
    
      def destroy
        # Delete a specific Customer from the database
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to customers_path
      end
    
      private
    
      def customer_params
        params.require(:customer).permit(:name, :phone_number, :address, :total_debits)
      end
end
