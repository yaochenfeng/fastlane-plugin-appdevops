require 'fastlane/action'
require_relative '../helper/appdevops_helper'

module Fastlane
  module Actions
    class AppdevopsAction < Action
      def self.run(params)
        UI.message("The appdevops plugin is working!")
      end

      def self.description
        "app自动化"
      end

      def self.authors
        ["yaochenfeng"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "app自动化处理证书、打包、发布等"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "APPDEVOPS_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
