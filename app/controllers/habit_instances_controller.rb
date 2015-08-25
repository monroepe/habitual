class HabitInstancesController < ApplicationController
  before_action :authenticate_user!
  include HabitInstanceHelper

  def index
    self.create_habit_instances
    today = Time.new
    @habit_instances = current_user.habit_instances.where(date: today).order(date: :desc)
  end

  def show
    @habit_instance = current_user.habit_instances.find(params[:id])
  end

  def update
    @habit_instance = HabitInstance.find(params[:id])
    @habit_instance.complete = !@habit_instance.complete
    @habit_instance.save

    redirect_to user_habit_instances_path(current_user)
  end

  private

  def habit_params
    params.require(:habit_instance).permit(:complete)
  end
end
