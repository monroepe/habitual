class HabitInstancesController < ApplicationController
  before_action :authenticate_user!

  def index
    time = Time.new
    @habit_instances = current_user.habit_instances.find(time.strftime("%m/%d/%Y"))
  end

  def show
    @habit = current_user.habit_instances.find(params[:id])
  end

  def edit
    @habit = current_user.habit_instances.find(params[:id])
  end

  def update
    @habit = current_user.habit_instances.find(params[:id])

    if @habit.update(habit_params)
      redirect_to user_habits_path(current_user), notice: "Habit updated successfully!"
    else
      render "edit"
    end
  end

  private

  def habit_params
    params.require(:habit_instance).permit(:complete)
  end
end
