#
# Be sure to run `pod lib lint JCNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCNetworking'
<<<<<<< HEAD
  s.version          = '0.3.0'
  s.summary          = '简单网络框架'
=======
  s.version          = '0.2.0'
  s.summary          = '罗汉番天印的简单的网络框架'
>>>>>>> 9be7ea93474dfe29729393f976f6915de7865d1c

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/JackCoderForLove/JCNetworking'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
<<<<<<< HEAD
  s.author           = { 'JackCoderForLove' => '979900351@qq.com' }
=======
  s.author           = { 'lice' => '979900351@qq.com' }
>>>>>>> 9be7ea93474dfe29729393f976f6915de7865d1c
  s.source           = { :git => 'https://github.com/JackCoderForLove/JCNetworking.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JCNetworking/Classes/**/*'
  
<<<<<<< HEAD
  # s.resource_bundles = {
  #   'JCNetworking' => ['JCNetworking/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Toast', '~> 4.0.0'
   s.dependency 'AFNetworking', '~> 3.2.0'
=======
  #s.resource_bundles = {
  #   'JCNetworking' => ['JCNetworking/Assets/*.png']
  # }

  #s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit','Foudation','WebKit'
   s.dependency 'AFNetworking', '~> 3.2.0'
   s.dependency 'Toast', '~> 4.0.0'
>>>>>>> 9be7ea93474dfe29729393f976f6915de7865d1c
end
