#
# Be sure to run `pod lib lint MXList.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MXList'
  s.version          = '0.1.0'
  s.summary          = '对UITableView整个使用流程的一个简单封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       对UITableView整个使用流程的一个简单封装，屏蔽了UITableViewCell,支持直接注册任意UIView子类到UITableView
                       支持对任意UIView子类重用
                       DESC

  s.homepage         = 'https://github.com/xuvw/MXList'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xuvw' => 'smileshitou@hotmail.com' }
  s.source           = { :git => 'https://github.com/xuvw/MXList.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  # s.source_files = 'MXList/Classes/**/*'

  s.subspec 'controller' do |ct|

    ct.source_files = 'MXList/controller/**/*.{h,m,m}'
    ct.frameworks = 'UIKit','Foundation'

    ct.xcconfig  = {
    'OTHER_LINKER_FLAGS' => '-ObjC'
    }

  end

  s.subspec 'models' do |md|

    md.source_files = 'MXList/models/**/*.{h,m,m}'
    md.frameworks = 'UIKit','Foundation'

    md.xcconfig  = {
    'OTHER_LINKER_FLAGS' => '-ObjC'
    }

  end

  s.subspec 'views' do |vw|

    vw.source_files = 'MXList/views/**/*.{h,m,m}'
    vw.frameworks = 'UIKit','Foundation'

    vw.xcconfig  = {
    'OTHER_LINKER_FLAGS' => '-ObjC'
    }

  end
  
  # s.resource_bundles = {
  #   'MXList' => ['MXList/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
