class RatingsController < ApplicationController

def index
  @rating = Rating.all
end

def show
  
  @recipe = Recipe.find(params[:recipe_id])
  @rating = Rating.find(params[:id])
end


def new
  @recipe = Recipe.find(params[:recipe_id])
  @rating = Rating.new
end

def create
  @recipe = @recipe = Recipe.find(params[:recipe_id])
  @rating = Rating.new(description:params[:rating][:description])
  @rating.user_id = session[:user_id]
  @rating.recipe_id = params[:recipe_id]
  if @rating.save
    redirect_to  recipe_rating_path(params[:recipe_id], @rating)
  else 
    render :new 
  end 
end

def edit
  @rating = Rating.find(params[:id])
  @recipe = Recipe.find(params[:recipe_id])
end

def update
  @rating = Recipe.find(params[:id])
  @rating.update(rating_params)
  redirect_to recipe_path(@recipe.recipe_id)
end

def destroy
  @rating.destroy
      flash[:notice] = "#{@rating.description} was deleted."
      redirect_to recipes_path
end 

private 
def review_params
 params.require(:rating).permit(:description,:user_id,:rating_id,:recipe_id)
end 


end 