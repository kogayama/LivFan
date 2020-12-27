class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group.id)
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:concept, :introduction, user_ids: [])
  end
end
