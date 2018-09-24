class RecipesController < ApplicationController
    def recipe_params
        params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new 
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new recipe_params

        if @recipe.save
            redirect_to @recipe
        else
            flash[:notice] = "Você deve informar todos os dados da receita"
            render :new
        end 
    end 

    def edit
        @recipe = Recipe.find params[:id]
    end 

    def update
        @recipe = Recipe.find params[:id]

        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            flash[:notice] = "Você deve informar todos os dados da receita"
            render :edit
        end
    end 
end