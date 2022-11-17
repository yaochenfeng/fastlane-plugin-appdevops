module Fastlane
  module Actions

    class IosAutoBuildIpaAction < Action
      def self.run(params)
        # 自动证书同步
        autoCode_signing
        #检测pod自动安装
        autoPodInstall
        #自动增加build号
        autoIncrement
        #自动构建app
        other_action.build_app(
          build_path: "build",
          export_method: isDebug ? "development" : "app-store"
        )
      end

      # 自动增加build号
      def self.autoIncrement
        if isDebug
          other_action.increment_build_number(build_number: other_action.number_of_commits)
        else
          other_action.increment_build_number(
            build_number: other_action.latest_testflight_build_number(version: other_action.get_version_number) + 1,
          )
        end
      end

      # 检测pod自动安装
      def self.autoPodInstall
        other_action.cocoapods(try_repo_update_on_error:true) if File.file?("Podfile")
      end
      # 自动同步证书
      def self.autoCode_signing
        ENV['MATCH_READONLY'] = "true" unless ENV['MATCH_READONLY']
        ENV['MATCH_KEYCHAIN_PASSWORD'] = "123456" unless ENV['MATCH_KEYCHAIN_PASSWORD']
        
        other_action.sync_code_signing(
          type: isDebug ? "development" : "appstore" ,
          api_key: isDebug ? nil : auto_api_key,
        )
      end

      def self.auto_api_key
        return nil unless ENV['APP_STORE_CONNECT_API_KEY_KEY_ID']
        other_action.app_store_connect_api_key unless isDebug
      end
      def self.isDebug
        return Actions.lane_context[SharedValues::AUTO_BUILD_DEBUG]
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "iOS自动打包"
      end

      def self.details
        "证书同步,版本自增，构建IPA"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: apptype,
          #                              env_name: "FL_IOS_AUTO_BUILD_IPA_API_TOKEN", # The name of the environment variable
          #                              description: "API Token for IosAutoBuildIpaAction", # a short description of this parameter
          #                              verify_block: proc do |value|
          #                                 UI.user_error!("No API token for IosAutoBuildIpaAction given, pass using `api_token: 'token'`") unless (value and not value.empty?)
          #                                 # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
          #                              end)
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        ["yaochenfeng"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
