class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]
  def index
    @tag = Tag.all
  end
  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    flash.notice = "Tag #{@tag.name} has been removed!"
    @tag.destroy
    redirect_to tags_path
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
