class CustomersController < ApplicationController
    def index
        # Display a list of all Customers
        # @customers = Customer.all
        if params[:phone_number].present? && params[:phone_number].match(/[0-9]/)
         @customer_phone = params[:phone_number].strip
          render json: {status: 201, content: Customer.where("phone_number LIKE ?", "%#{@customer_phone}%")}
        elsif params[:name].present? && params[:name].match(/[a-zA-Z0-9]/)
          search_term = params[:name].strip
          render json: Customer.where("name LIKE ?", "%#{search_term}%")
        else
          render json: {status:404}
        end
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
          render json: {status:201}
        else
          render json: {status:401}

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
