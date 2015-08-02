class HabitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @habits = current_user.habits
  end

  def show
    @habit = current_user.habits.find(params[:id])
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user

    if @habit.save
      redirect_to user_habits_path(current_user), notice: "Habit created successfully!"
    else
      render "new"
    end
  end

  def edit
    @habit = current_user.habit.find(params[:id])
  end

  def update
    @habit = current_user.habit.find(params[:id])

    if @habit.update(habit_params)
      redirect_to user_habits_path(current_user), notice: "Habit updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @habit = current_user.habit.find(params[:id])

    @habit.destroy

    redirect_to user_habits_path(current_user), notice: "Habit deleted successfully!"
  end

  private

  def habit_params
    params.require(:habit).permit(:title,:description,:frequency)
  end
end
