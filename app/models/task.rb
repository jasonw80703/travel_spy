# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  task_type   :integer          default("food"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mission_id  :bigint           not null
#
# Indexes
#
#  index_tasks_on_mission_id  (mission_id)
#
# Foreign Keys
#
#  fk_rails_...  (mission_id => missions.id)
#
class Task < ApplicationRecord
  belongs_to :mission

  validates :name, presence: true

  enum :task_type, {
    food: 0,
    activity: 1,
    landmark: 2
  }
end
