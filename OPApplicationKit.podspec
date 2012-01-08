Pod::Spec.new do |s|
  s.name     = 'OPApplicationKit'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  
  s.summary       = 'OPApplicationKit'
  s.homepage      = 'https://brandonwilliams.beanstalkapp.com/opapplicationkit'
  s.author        = { 'Brandon Williams' => 'brandon@opetopic.com' }
  s.source        = { :git => 'git@brandonwilliams.beanstalkapp.com:/opappliationkit.git' }
  s.requires_arc  = true
  
  s.source_files = 'Source/**/*.{h,m}'
  
  s.frameworks = 'CoreData'
  
  s.dependency 'MagicalRecord', :git => 'http://github.com/magicalpanda/MagicalRecord.git', :tag => '1.8'
  s.dependency 'OPExtensionKit', :git => 'git@brandonwilliams.beanstalkapp.com:/opextensionkit.git'
  
end