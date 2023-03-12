class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        # Display a list of all Categorys
        @categories = Category.all
        render json: @categories
      end
    
      def show
        # Display a specific Category
        if params[:id].present? && params[:id].match(/[0-9]/)
            @category = Category.includes(:products).where(products: {offline: false}).find(params[:id])
            render json: {status:201, content: @category.products}  
        elsif params[:id].present? && params[:id] == "first"
          @category = Category.includes(:products).where(products: {offline: false}).first
          render json: {status:201, content: @category.products}  
        else 
          record_not_found
        end
      end

      def new
        @category = Category.new(category_params)
      end

      def create
        # Save a new Category to the database
        @category = Category.new(category_params)
        if @category.save
          render json: @category, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    
      def update
        # Update a specific Category in the database
        @category = Category.find(params[:id])
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        # Delete a specific Category from the database
        @category = Category.find(params[:id])
        @category.destroy
        head :no_content
      end
    
      def record_not_found
        render json: {status:404}
      end
      private
    
      def category_params
        params.require(:category).permit(:name)
      end
end
