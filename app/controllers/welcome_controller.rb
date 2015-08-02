class WelcomeController < ApplicationController
  include HabitInstanceHelper

  def index
    if current_user
      self.create_habit_instances
    end
  end
end
