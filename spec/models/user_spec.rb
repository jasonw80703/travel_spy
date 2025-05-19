# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'callbacks' do
    describe '#set_username' do
      it 'generates a unique username' do
        user = FactoryBot.create(:user)
        expect(user.username).to be_present
      end

      it 'raises an error if the username is not unique' do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, username: user.username)
        expect { another_user.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
