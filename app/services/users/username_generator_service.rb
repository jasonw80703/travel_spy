# frozen_string_literal: true

module Users
  class UsernameGeneratorService
    SPY_NAMES = %w[jamesBond nancyDrew agentK jasonBourne ethanHunt jackRyan agentSmith sterlingArcher pettigrew sherlock].freeze

    def self.call
      "#{SPY_NAMES.sample}#{rand(10000...99999)}"
    end
  end
end
