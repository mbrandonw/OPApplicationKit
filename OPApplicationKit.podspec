Pod::Spec.new do |spec|
  spec.name         = 'OPApplicationKit'
  spec.version      = '0.1.0'
  spec.license      = { type: 'BSD' }
  spec.homepage     = 'https://github.com/mbrandonw/OPApplicationKit'
  spec.authors      = { 'Brandon Williams' => 'mbw234@gmail.com' }
  spec.summary      = ''
  spec.source       = { :git => 'https://github.com/mbrandonw/OPApplicationKit.git' }
  spec.source_files = 'OPApplicationKit/Source/*.{h,m}'
  spec.requires_arc = true

  spec.frameworks = 'CoreData'

  spec.dependency 'OPExtensionKit'
end
