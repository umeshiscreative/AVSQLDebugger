source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
platform :ios, '10.0'

workspace 'AVSQLDebugger'

$podSource = {:path => './'}

target 'AVSQLDebugger' do
    project 'AVSQLDebugger/AVSQLDebugger.xcodeproj'
    pod 'Criollo', '~> 0.4’
end

target 'Example' do

  project 'Example/Example.xcodeproj'

  pod 'AVSQLDebugger', $podSource

  target 'ExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
            config.build_settings['ENABLE_BITCODE'] = "NO"
            config.build_settings['SWIFT_VERSION'] = "5.0"
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = "10.0"
        end
    end
end
