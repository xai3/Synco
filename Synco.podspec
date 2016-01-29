Pod::Spec.new do |s|
  s.name = 'Synco'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.homepage = 'https://github.com/yukiasai/'
  s.summary = 'Simple @syncronized for Swift.'
  s.authors = { 'yukiasai' => 'yukiasai@gmail.com' }
  s.source = { :git => 'https://github.com/yukiasai/Synco.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  
  s.source_files = 'Classes/*.swift'
end

