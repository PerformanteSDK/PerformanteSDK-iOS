Pod::Spec.new do |s|
  s.name         = 'PerformanteSDK'
  s.version      = '1.0'
  s.summary      = 'iOS SDK for tracking.'
  s.description  = 'PerformanteSDK is a tool for tracking different events in your application.'
  s.homepage     = "https://github.com/PerformanteSDK/PerformanteSDK-iOS"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author       = { 'Performante, Sp. z o.o.' => 'performante@performante.com' }
  s.source       = { :git => 'https://github.com/PerformanteSDK/PerformanteSDK-iOS.git', :tag => '1.0' }
  s.platform     = :ios, '8.0'
  s.library      = 'z'
  s.requires_arc = true
  s.preserve_path = 'PerformanteSDK.framework'
  s.vendored_frameworks = 'PerformanteSDK.framework'
  s.xcconfig     = { 'OTHER_LDFLAGS' => '-ObjC, -lz' }
end
