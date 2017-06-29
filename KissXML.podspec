Pod::Spec.new do |s|
  s.name         = 'KissXML'
  s.version      = '5.2.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.summary      = 'A replacement for Cocoa\'s NSXML cluster of classes. Based on libxml.'
  s.homepage     = 'https://github.com/robbiehanson/KissXML'
  s.author       = { 'Robbie Hanson' => 'robbiehanson@deusty.com' }
  s.source       = { :git => 'https://github.com/robbiehanson/KissXML.git', :tag => s.version }

  s.requires_arc = true

  s.preserve_paths = 'README.markdown', 'KissXML/DDXML.swift'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'KissXML/**/*.{h,m,swift}'
  s.private_header_files = 'KissXML/Private/**/*.h'
  s.osx.exclude_files = 'KissXML/**/*.swift'
  s.library      = 'xml2'
  s.xcconfig     = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2'}

  s.default_subspecs = 'Default'

  s.subspec 'Default' do |ss|
    ss.source_files         = 'KissXML/KissXML.h', 'KissXML/DDXML*.{h,m}', 'KissXML/Additions/*.{h,m}', 'KissXML/Categories/*.{h,m}', 'KissXML/Private/*.{h,m}'
    ss.public_header_files  = 'KissXML/KissXML.h', 'KissXML/DDXML*.h', 'KissXML/Additions/*.h', 'KissXML/Categories/*.h'
    ss.private_header_files = 'KissXML/Private/*.h'
  end

  s.subspec 'Swift' do |ss|
    ss.ios.deployment_target      = '8.0'
    ss.osx.deployment_target      = '10.9'
    ss.tvos.deployment_target     = '9.0'
    ss.watchos.deployment_target  = '2.0'
    ss.dependency 'KissXML/Default'
    ss.source_files               = 'KissXML/DDXML.swift', 'KissXML/KissXMLSwift.h'
    ss.public_header_files        = 'KissXML/KissXMLSwift.h'
  end

end
