# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :bigint           not null
#
# Indexes
#
#  index_cities_on_country_id           (country_id)
#  index_cities_on_name_and_country_id  (name,country_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (country_id => countries.id)
#
class City < ApplicationRecord
  belongs_to :country

  validates :name, presence: true, uniqueness: { scope: :country_id }
  validates :country, presence: true
end
