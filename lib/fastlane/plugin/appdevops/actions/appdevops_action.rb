require 'fastlane/action'
require_relative '../helper/appdevops_helper'

module Fastlane
  module Actions
    module SharedValues
      AUTO_BUILD_DEBUG = :AUTO_BUILD_DEBUG
    end
    class AppdevopsAction < Action
      def self.run(params)
        isDebug = params[:debug]
        UI.message("开始自动打#{isDebug ? "开发" : "appstore"}版本ipa并且上传!")
        Actions.lane_context[SharedValues::AUTO_BUILD_DEBUG] = isDebug
        other_action.ios_auto_build_ipa
        other_action.ios_auto_upload
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
      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['AUTO_BUILD_DEBUG', 'A description of what this value contains']
        ]
      end

      def self.details
        # Optional:
        "app自动化处理证书、打包、发布等"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :debug,
            description: "开发模式还是appstore模式",
            optional: true,
            default_value: false,
            is_string: false)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
