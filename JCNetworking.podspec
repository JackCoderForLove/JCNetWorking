#
# Be sure to run `pod lib lint JCNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCNetworking'

  s.version          = '0.5.0'
  s.summary          = '简单网络框架'


# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '神一般的框架'

  s.homepage         = 'https://github.com/JackCoderForLove/JCNetworking'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  s.author           = { 'JackCoderForLove' => '979900351@qq.com' }

  s.source           = { :git => 'https://github.com/JackCoderForLove/JCNetworking.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JCNetworking/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JCNetworking' => ['JCNetworking/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  #s.dependency 'Toast', '~> 4.0.0'
   s.dependency 'AFNetworking', '~> 3.2.0'

end
