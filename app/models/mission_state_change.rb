# == Schema Information
#
# Table name: mission_state_changes
#
#  id         :bigint           not null, primary key
#  from_state :string           not null
#  to_state   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mission_id :bigint           not null
#
# Indexes
#
#  index_mission_state_changes_on_mission_id  (mission_id)
#
# Foreign Keys
#
#  fk_rails_...  (mission_id => missions.id)
#
class MissionStateChange < ApplicationRecord
  belongs_to :mission

  validates :to_state, :from_state, presence: true
end
