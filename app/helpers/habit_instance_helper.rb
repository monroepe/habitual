module HabitInstanceHelper
  # This helper will create a habit instance for the day if there isn't on for the day

  def create_habit_instances
    habits = current_user.habits
    today = Time.new.strftime("%Y-%d-%m")

    habits.each do |habit|
      if current_user.habit_instances.where(habit_id: habit.id).where(date: today) == []
        habit_instance = current_user.habit_instances.build({date: today, habit_id: habit.id, user_id: current_user.id, complete: false})
        habit_instance.save
      end
    end
  end
end
