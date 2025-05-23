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
FactoryBot.define do
  factory :mission do
    user
    city
    name { Faker::Lorem.word }
    state { 'pending' }
  end
end
