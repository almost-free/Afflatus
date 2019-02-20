#
# Be sure to run `pod lib lint Afflatus.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Afflatus'
  s.version          = '0.1.0'
  s.summary          = 'Swift libMuse wrapper'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Afflatus is a Swifty wrapper on top of libMuse from Interaxon
                       DESC

  s.homepage         = 'https://github.com/almost-free/Afflatus'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jon Willis' => 'jon@almostfree.tech' }
  s.source           = { :git => 'https://github.com/almost-free/Afflatus.git', :tag => s.version.to_s }
  s.social_media_url = 'https://instagram.com/deeperfocus.app'

  s.ios.deployment_target = '11.0'

  s.static_framework = true

  s.swift_version = '4.2'

  s.frameworks = 'CoreBluetooth'
  s.library = 'c++'

  s.subspec 'Core' do |core|

    core.source_files = 'Afflatus/Core/**/*'
    core.vendored_frameworks = 'libMuse/Muse.framework'
    core.dependency 'RxSwift'
  end

  s.subspec 'UI' do |ui|
    ui.dependency 'Afflatus/Core'
  end

end
