#
# Be sure to run `pod lib lint EProgress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EProgress'
  s.version          = '0.1.0'
  s.summary          = '可方便在storyboard中使用的进度条'
  s.description      = <<-DESC
方便定制的进度条, 支持storyboard中实时的状态更新
                       DESC

  s.homepage         = 'https://github.com/lazyjean/EProgress'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liuzhen' => 'lazyjean@foxmail.com' }
  s.source           = { :git => 'https://github.com/lazyjean/EProgress.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'EProgress/**/*'
  s.frameworks = 'UIKit'
end
