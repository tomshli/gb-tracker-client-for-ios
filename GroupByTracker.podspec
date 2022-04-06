Pod::Spec.new do |s|
    s.name             = 'GroupByTracker'
    s.version          = '0.1.0'
    s.summary          = 'GroupBy Tracker Client for iOS'
    s.homepage         = 'https://github.com/tomshli/gb-tracker-client-for-ios'
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'GroupBy Inc.' => 'support@groupbyinc.com' }
    s.source           = { :git => 'https://github.com/tomshli/gb-tracker-client-for-ios.git', :tag => s.version.to_s }
    s.ios.deployment_target = '13.0'
    s.swift_version = '3.0'
    s.source_files = 'Sources/GroupByTracker/**/*'
  end