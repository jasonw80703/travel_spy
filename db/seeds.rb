# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# frozen_string_literal: true

COUNTRIES = [
  { name: 'United States', code: 'US' },
  { name: 'Canada', code: 'CA' },
  { name: 'Mexico', code: 'MX' },
  { name: 'United Kingdom', code: 'UK' },
  { name: 'Australia', code: 'AU' },
  { name: 'Japan', code: 'JP' },
  { name: 'China', code: 'CN' },
  { name: 'India', code: 'IN' }
]

Country.insert_all(COUNTRIES, unique_by: :code)

CITIES = [
  { name: 'New York', country_id: Country.find_by(code: 'US').id },
  { name: 'Toronto', country_id: Country.find_by(code: 'CA').id },
  { name: 'Mexico City', country_id: Country.find_by(code: 'MX').id },
  { name: 'London', country_id: Country.find_by(code: 'UK').id },
  { name: 'Sydney', country_id: Country.find_by(code: 'AU').id },
  { name: 'Tokyo', country_id: Country.find_by(code: 'JP').id },
  { name: 'Beijing', country_id: Country.find_by(code: 'CN').id },
  { name: 'Mumbai', country_id: Country.find_by(code: 'IN').id }
]

City.insert_all(CITIES, unique_by: %i[name country_id])
