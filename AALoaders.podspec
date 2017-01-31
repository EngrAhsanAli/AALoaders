Pod::Spec.new do |s|
s.name             = 'AALoaders'
s.version          = '0.1.0'
s.summary          = 'AALoaders is a lightweight, easy-to-use and powerful progress view loaders framework written in Swift.'

s.description      = <<-DESC
AALoaders is a lightweight, easy-to-use and powerful progress view loaders framework, written in Swift. It uses simple native elements for progress loading with customisations and allow to use without creating instance.
DESC

s.homepage         = 'https://github.com/EngrAhsanAli/AALoaders'
s.screenshots     = 'https://raw.githubusercontent.com/EngrAhsanAli/AALoaders/master/Screenshots/Home.png'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Engr. Ahsan Ali' => 'hafiz.m.ahsan.ali@gmail.com' }
s.source           = { :git => 'https://github.com/EngrAhsanAli/AALoaders.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'

s.source_files = 'AALoaders/Classes/**/*'

end






