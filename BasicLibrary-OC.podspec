#
# Be sure to run `pod lib lint BasicLibrary-OC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BasicLibrary-OC'
  s.version          = '0.1.5'
  s.summary          = 'A basic library for Objective-C developers.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        文件分类如下：
                        Base -> 基础类文件
                        ExternCategory -> 分类文件
                        Tools -> 工具类
                       DESC

  s.homepage         = 'https://github.com/lvyingliang200/BasicLibrary-OC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lvyingliang200' => '475478714@qq.com' }
  s.source           = { :git => 'https://github.com/lvyingliang200/BasicLibrary-OC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'BasicLibrary-OC/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BasicLibrary-OC' => ['BasicLibrary-OC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
