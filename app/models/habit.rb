class Habit < ActiveRecord::Base
  belongs_to :user
  has_many :habit_instances

  validates :title, :frequency, :user_id, presence: true
end
