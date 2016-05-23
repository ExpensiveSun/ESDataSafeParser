#
# Be sure to run `pod lib lint DataSafeParser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DataSafeParser"
  s.version          = "0.1.1"
  s.summary          = "A short description of DataSafeParser."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = "git@172.17.150.61/DataSafeParser"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "suguiyang" => "suguiyang@felink.com" }
  s.source           = { :svn => 'http://svn.dian91.com/svn/sj_91weather/client/IOS/91WeatherCentral/CentralComponent/trunk/DataSafeParser' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '5.0'

  s.source_files = 'DataSafeParser/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DataSafeParser' => ['DataSafeParser/Assets/*.png']
  # }

  s.public_header_files = 'DataSafeParser/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
