source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
platform :ios, '10.0'

workspace 'AVSQLDebugger'

$podSource = {:path => '../'}

target 'AVSQLDebugger' do
    project 'AVSQLDebugger/AVSQLDebugger.xcodeproj'
    pod 'Criollo', '~> 0.4’
end

target 'Example' do

  project 'Example/Example.xcodeproj'

  pod 'EasyDB', $podSource

  target 'ExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end
end
