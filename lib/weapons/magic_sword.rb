# frozen_string_literal: true

require_relative '../../lib/settings/game_settings'

class MagicSword
  def self.strike
    GameSettings.settings[:magic_sword_strike]
  end
end
