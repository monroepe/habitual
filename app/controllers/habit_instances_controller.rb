class HabitInstancesController < ApplicationController
  before_action :authenticate_user!
  include HabitInstanceHelper

  def index
    self.create_habit_instances
    today = Time.new.strftime("%Y-%d-%m")
    @habit_instances = current_user.habit_instances.where(date: today)
  end

  def show
    @habit_instance = current_user.habit_instances.find(params[:id])
  end

  def update
    @habit_instance = current_user.habit_instances.find(params[:id])

    @habit.update(habit_params)
  end

  private

  def habit_params
    params.require(:habit_instance).permit(:complete)
  end
end
