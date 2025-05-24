class QuestsController < ApplicationController
  def index
    @quests = Quest.all
    @new_quest = Quest.new
  end

  def create
    Quest.create!(quest_params)
    redirect_to root_path
  end

  def update
  end

  def destroy
  end

  def brag
  end

  private
    def quest_params
      params.require(:quest).permit(:title)
    end
end
