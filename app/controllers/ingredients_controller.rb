class IngredientsController < ApplicationController
  def index
    @recipes = Recipe.all
    fresh_when(@recipes)
  end

  def show
  end 

    if @recipe.instructions.attachment.nil? == false && @recipe.instructions.previewable?
      logger.debug 'instructions are previewable'
    end
  end

  

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe updated successfully'
      redirect_to recipe_path(@recipe)
    else
      logger.debug "Recipe errors #{@recipe.errors.full_messages}"
      @ingredients = Ingredient.all
      render 'edit'
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = 'Success!'
      redirect_to recipe_path(@recipe)
    else
      logger.debug "Recipe errors #{@recipe.errors.full_messages}"
      @ingredients = Ingredient.all
      render 'new'
    end
  end


  private


  def recipe_params
    params.require(:recipe)
          .permit(:name,
                  :content,
                  ingredient_id: [])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end


  def set_ingredients
    @ingredients = Ingredient.all
  end
