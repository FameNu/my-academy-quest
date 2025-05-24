class QuestsController < ApplicationController
  before_action :set_quest, only: [ :update, :destroy ]

  def index
    @quests = Quest.all
    @new_quest = Quest.new
  end

  def create
    Quest.create!(quest_params)
    redirect_to root_path
  end

  def update
    @quest.update(completed: !@quest.completed)
    redirect_to root_path
  end

  def destroy
    @quest.destroy
    redirect_to root_path
  end

  def brag
  end

  private
    def quest_params
      params.require(:quest).permit(:title)
    end

    def set_quest
      @quest = Quest.find(params[:id])
    end
end
