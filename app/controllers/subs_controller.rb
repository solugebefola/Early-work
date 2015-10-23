class SubsController < ApplicationController
  before_action :user_is_mod?, only: [:edit]

  def user_is_mod?
    current_user.id == params[:mod_id]
  end

  def new
    @sub = Sub.new
    @sub.mod_id = current_user.id
  end

  def create
  end

  def edit
  end

  def index
  end


  private
  def sub_params
    params.require(:sub).permit(:title, :description, :mod_id)
  end
end
