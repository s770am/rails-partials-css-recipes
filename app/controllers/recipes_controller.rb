class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipes_url
        else
            redirect_to recipe_url
        end
    end


    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipes_url
        else
            render :edit
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
      @recipe.destroy
        redirect_to recipes_url
        
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :prep_time, :ingredients)
    end
end
