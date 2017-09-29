projName = 'Exampled'
projSummary = 'Set of development time helpers for writing model-driven types.'
companyPrefix = 'XCE'
companyName = 'XCEssentials'
companyGitHubAccount = 'https://github.com/' + companyName
companyGitHubPage = 'https://' + companyName + '.github.io'

#===

Pod::Spec.new do |s|

  s.name                      = companyPrefix + projName
  s.summary                   = projSummary
  s.version                   = '1.0.0'
  s.homepage                  = companyGitHubPage + '/' + projName
  
  s.source                    = { :git => companyGitHubAccount + '/' + projName + '.git', :tag => s.version }
  
  s.osx.deployment_target     = '10.11'
  s.ios.deployment_target     = '9.0'
  s.requires_arc              = true
  
  s.license                   = { :type => 'MIT', :file => 'LICENSE' }
  s.author                    = { 'Maxim Khatskevich' => 'maxim@khatskevi.ch' }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |ss|

    ss.osx.deployment_target  = '10.11'
    ss.ios.deployment_target  = '9.0'

    ss.source_files           = 'Sources/Core/**/*.swift'

  end

  s.subspec 'ModelDependable' do |ss|

    ss.ios.deployment_target  = '9.0'

    ss.dependency               s.name + '/Core'
    ss.dependency               'XCEModelDependable', '~> 1.0'
  
    ss.source_files           = 'Sources/ModelDependable/**/*.swift'

  end

  s.subspec 'UniFlow' do |ss|

    ss.ios.deployment_target  = '9.0'

    ss.dependency               s.name + '/Core'
    ss.dependency               'XCEUniFlow', '~> 4.6'
  
    ss.source_files           = 'Sources/UniFlow/**/*.swift'

  end

end
