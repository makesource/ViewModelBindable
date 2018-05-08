#
# Be sure to run `pod lib lint ViewModelBindable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
@version = '1.0.1'

Pod::Spec.new do |s|
  s.name             = 'ViewModelBindable'
  s.version          = @version
  s.summary          = 'Super easy way to bind ViewModel'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ViewModelBindable supports easy ViewModel binding for MVVM architecture. ViewModelBindable will inject required method for binding into your ViewController & View life-cycle. Just enjoy it!
                       DESC

  s.homepage         = 'https://github.com/makesource/ViewModelBindable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'makesource' => 'makesource@gmail.com' }
  s.source           = { :git => 'https://github.com/makesource/ViewModelBindable.git', :tag => "v#{s.version}" }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ViewModelBindable/Classes/**/*'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RxSwift', '>= 4.0.0'
end
