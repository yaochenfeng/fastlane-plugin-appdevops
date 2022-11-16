module Fastlane
  module Actions
    module SharedValues
    end

    class IosAutoUploadAction < Action
      def self.run(params)
        uploadDebug if isDebug
        uploadBeta unless isDebug
      end

      # 上传testflight
      def self.uploadBeta
        UI.message "没有登录 APP_STORE_CONNECT_API_KEY" unless ENV['APP_STORE_CONNECT_API_KEY']
        other_action.upload_to_testflight if ENV['APP_STORE_CONNECT_API_KEY']
      end
      # 上传debug
      def self.uploadDebug
        uploadPyger
      end

      def self.uploadPyger
        other_action.pgyer if ENV['PGYER_API_KEY'] && ENV['PGYER_USER_KEY']
      end

      def self.isDebug
        return Actions.lane_context[SharedValues::AUTO_BUILD_DEBUG]
      end
      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "A short description with <= 80 characters of what this action does"
      end

      def self.details
        "自动上传app"
      end

      def self.available_options
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
