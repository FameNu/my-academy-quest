class QuestsController < ApplicationController
  def index
    @quests = Quest.all
    @new_quest = Quest.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def brag
  end
end
