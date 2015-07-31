class Habit < ActiveRecord::Base
  belongs_to :user

  validates :title, :frequency, :user_id, presence: true
end
