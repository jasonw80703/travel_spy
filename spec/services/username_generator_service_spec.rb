require 'rails_helper'

RSpec.describe Users::UsernameGeneratorService do
  describe '#call' do
    it 'generates a unique username' do
      expect(described_class.call).to be_present
    end
  end
end
