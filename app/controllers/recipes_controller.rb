class RecipesController < ApplicationController
    def show
        @recipe = Recipe.find(params[:id])
    end

    def new 
        @recipe = Recipe.new
    end
    
    def create
        recipe_params = params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)
        
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end 
    end 
end