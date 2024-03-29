#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'

module SocialMediaBackup
  class BackupEngine
    require 'social_media_backup/twitter'

    SOCIAL_MEDIA_PLATFORMS = [Twitter].freeze

    def initialize(config_path)
      @config = load_config(config_path)
    end

    def self.back_up
      SOCIAL_MEDIA_PLATFORMS.each(&:back_up)
    end

    def load_config(config_path)
      YAML.load_file(config_path)
    end
  end
end
