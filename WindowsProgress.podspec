Pod::Spec.new do |s|
s.name             = "WindowsProgress"
s.version          = "1.0"
s.summary          = "Imitation windows progress bar on iOS"
s.description      = <<-DESC
在iOS平台上模仿wind下的进度条 Imitation windows progress bar on iOS
DESC
s.homepage         = "https://github.com/zhwe130205/WindwosProgress"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "Bourbon" => "zhengweiios@icloud.com" }
s.source           = { :git => "https://github.com/zhwe130205/WindwosProgress.git",:tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/NAME'

s.platform     = :ios, '7.0'
# s.ios.deployment_target = '5.0'
# s.osx.deployment_target = '10.7'
s.requires_arc = true

s.source_files = 'WindowsProgress/WindowsProgress/*.{h,m}'
# s.resources = 'Assets'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'Foundation', 'UIKit'

end