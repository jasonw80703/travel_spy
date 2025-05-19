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
require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
