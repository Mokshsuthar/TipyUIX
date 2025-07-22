#
# Be sure to run `pod lib lint TipyUIX.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TipyUIX'
  s.version          = '0.1.0'
  s.summary          = 'A SwiftUI library for enhanced UI components.'
  s.description      = 'TipyUIX provides custom SwiftUI views and UI components to enhance your app design.'
  s.homepage         = 'https://github.com/yourusername/TipyUIX' # Replace with actual URL
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :git => 'https://github.com/yourusername/TipyUIX.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'
  
  # Specify the platform and minimum version
  s.platform         = :ios, '16.5'

  s.source_files     = 'TipyUIX/**/*.swift', 'TipyUIX/**/*.xcassets'
  s.frameworks       = 'SwiftUI'
  
   # Add the asset files to the pod
  s.resource_bundles = {
    'TipyUIXAssets' => ['TipyUIX/*.xcassets']
  }
  
  # Add the dependency on SwiftyUIX
  s.dependency 'SwiftyUIX'
end
