class CategoriesController < ApplicationController
  before_action :require_admin, except: %i[index show]
  before_action :set_category, only: %w[show edit update destroy]


  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category Created Successfully'
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 6)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category name updated successfully'
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, status: :see_other
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :thumb, :description)
  end

  def require_admin
    return if logged_in? && current_user.admin?

    flash[:alert] = 'Only admins can perform that action'
    redirect_to categories_path
  end
end