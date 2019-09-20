Pod::Spec.new do |s|
  s.name         = "AVSQLDebugger"
  s.version      = "1.0.2"
  s.summary      = "A framework to easily debug your data storage in apps.."
  s.platform     = :ios, "10.0"
  s.author       = "Umesh Verma"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'https://github.com/umeshiscreative/AVSQLDebugger'
  s.source  = { :git => "https://github.com/umeshiscreative/AVSQLDebugger.git", :tag => "#{s.version}" }
  s.source_files  = ["AVSQLDebugger/AVSQLDebugger/**/*.{h,m,swift}"]
  s.resources = ["AVSQLDebugger/AVSQLDebugger/**/*.{html,js,css}"]
  s.requires_arc = true
  s.dependency "Criollo", '~> 0.4'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.ios.deployment_target  = '10.0'
  s.swift_version = '5.0'
end