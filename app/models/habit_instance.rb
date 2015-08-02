class HabitInstance < ActiveRecord::Base
  belongs_to :user
  belongs_to :habit

  validates :user_id, :habit_id, :date, presence: true
end
