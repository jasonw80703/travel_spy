# == Schema Information
#
# Table name: missions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  state      :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_missions_on_city_id  (city_id)
#  index_missions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (user_id => users.id)
#
class Mission < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :city

  has_many :mission_state_changes, dependent: :destroy

  aasm column: :state do
    state :pending, initial: true
    state :active
    state :completed
    state :failed

    after_all_transitions :create_state_change!

    event :start do
      transitions from: :pending, to: :active
    end

    event :complete do
      transitions from: :active, to: :completed
    end

    event :fail do
      transitions from: :active, to: :failed
    end
  end

  private

  def create_state_change!
    MissionStateChange.create(mission: self, from_state: aasm.from_state, to_state: aasm.to_state)
  end
end
