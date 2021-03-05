class RecipesIngredientsController < ApplicationController

def rating_index
 end

 def show_rating
   @recipe = Recipe.find(params[:id])
   @rating = RecipeIngredient.find(params[:recipe_id])
 end

 
 def new_rating
   @recipe = Recipe.find(params[:id])
   @rating = @recipe.rating.build
   
 end

 def create_rating
   @rating = RecipeIngredient.new(review_params)
   if @rating.save
     redirect_to new_recipe_recipes_ingredient_path(params[:recipe_id], @rating)
   else 
     render :new 
   end 
 end

 def edit_rating
   @rating = RecipeIngredient.find(params[:id])
   @recipe = Recipe.find(params[:recipe_id])
 end

 def update_rating
   @rating = Recipe.find(params[:id])
   @rating.update(rating_params)
   redirect_to recipe_path(@recipe.recipe_id)
 end

 def destory_rating
 end 

 private 
  def review_params
   params.require(:recipeingredient).permit(:description,:recipe_id)
  end 


end 