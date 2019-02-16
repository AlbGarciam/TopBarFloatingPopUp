#
# Be sure to run `pod lib lint TopBarFloatingPopUp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TopBarFloatingPopUp'
  s.version          = '0.1.3'
  s.summary          = 'Custom pop up to provide information to the user'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Custom PopUp that can be used to display errors or tooltips to the user.'

  s.homepage         = 'https://github.com/AlbGarciam/TopBarFloatingPopUp.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alb.garciam@gmail.com' => 'alb.garciam@gmail.com' }
  s.source           = { :git => 'https://github.com/AlbGarciam/TopBarFloatingPopUp.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  s.exclude_files = "Constrictor/Constrictor/*.plist"

  s.source_files = 'TopBarFloatingPopUp/Classes/**/*'
  
end
