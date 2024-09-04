Pod::Spec.new do |s|
  s.name        = "HSongPopUpAssistant"
  s.version     = "0.1.5"
  s.summary     = "It can help you pop reset view or custom view easy"
  s.homepage    = "https://github.com/Thered-key/HSongPopUpAssistant"
  s.license     = { :type => "MIT" }
  s.authors     = { "Thered-key" => "wereaiyou@163.com" }

  s.requires_arc = true
  s.swift_version = "5.0"

  #s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "12.0"
  #s.watchos.deployment_target = "2.0"
  #s.tvos.deployment_target = "9.0"

  s.source   = { :git => "https://github.com/Thered-key/HSongPopUpAssistant.git", :tag => s.version }
  s.source_files = "HSongPopUpAssistant/**/*.swift"
  #s.resources = "HSongPopUpAssistant/ResMine.bundle/*.gif"
  s.resource_bundles = {
	'ResMine' => ['HSongPopUpAssistant/ResMine.bundle/*.gif']
  }

  s.dependency 'MJRefresh'
  s.dependency 'Gifu'
  s.dependency 'MJExtension'
  s.dependency 'SnapKit'

end