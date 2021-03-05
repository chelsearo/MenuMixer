class RecipesController < ApplicationController
   
   
    def index
      @recipe = Recipe.all.order([:title])
    end
  
    def show
      @recipe = Recipe.find(params[:id])
    end
  
    def new
      @recipe = Recipe.new
      @ingredient = Ingredient.new
    end
  
    def create
      a = params[:recipe][:ingredients].delete_if{|c| c == "0"}
      
     recipe = Recipe.create(recipes_params)
     a.each do |ingredients|
      ing = Ingredient.find_or_create_by(name:ingredients)
      RecipesIngredient.create(recipe_id: recipe.id, ingredient_id: ing.id)
     end 
      redirect_to recipe_path(recipe)
    end


    def search
      @searchr = Recipe.where(title: "#{params[:title]}")
      @searchi = Ingredient.where(name: "#{params[:name]}")
    end 

    def destroy
      @recipe.destroy
      flash[:notice] = "#{@recipe.title} was deleted."
      redirect_to recipes_path
    end

    private
      def recipes_params
        params.require(:recipe).permit(:title, :content)
      end
  end