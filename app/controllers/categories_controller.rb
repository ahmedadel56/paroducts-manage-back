class CategoriesController < ApplicationController
    def index
        # Display a list of all Categorys
        @categories = Category.all
        render json: @categories
      end
    
      def show
        # Display a specific Category
        @category = Category.find(params[:id])
        render json: @category
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
    
      private
    
      def category_params
        params.require(:category).permit(:attribute1, :attribute2, :attribute3)
      end
end
