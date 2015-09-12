Pod::Spec.new do |s|
  s.name             = 'Date'
  s.version          = '0.1.0'
  s.summary          = 'A Swift Date Library.'
  s.homepage         = 'https://github.com/devxoul/Date.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Suyeol Jeon' => 'devxoul@gmail.com' }
  s.source           = { :git => 'https://github.com/devxoul/Date.swift.git', :tag => s.version.to_s }
  s.source_files     = 'Date/Date.swift'
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'
end
