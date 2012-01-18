Pod::Spec.new do |s|
  s.name     = 'OPApplicationKit'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  
  s.summary       = 'OPApplicationKit'
  s.homepage      = 'https://github.com/mbrandonw/OPApplicationKit'
  s.author        = { 'Brandon Williams' => 'brandon@opetopic.com' }
  s.source        = { :git => 'git@github.com:mbrandonw/OPApplicationKit.git' }
  s.requires_arc  = true
  
  s.source_files = 'OPApplicationKit/Source/**/*.{h,m}'
  s.requires_arc = true
  
  s.frameworks = 'CoreData'
  
end