class TagsController < ApplicationController
  before_action :find_tag, only: [:show, :edit, :update, :destroy]

  # ONLY ADMIN
  def index
    @tags = Tag.all.order(name: :asc).page(params[:page]).per(50)
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      flash[:notice] = 'Tag Created'
      redirect_to tag_path(@tag)
    else
      flash.now[:alert] = @tag.pretty_errors
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag.update(tag_params)
    redirect_to @tag, notice: "Successfully Updated"
  end

  def destroy
    if is_admin?
      @tag.destroy
      redirect_to tags_path, notice: "Tag Deleted!"
    else
      flash[:alert] = "Access Denied"
      redirect_to @tag
    end
  end

  private

  def tag_params
    params.require(:tag).permit([:name])
  end

  def find_tag
    @tag = Tag.find params[:id]
  end
end
