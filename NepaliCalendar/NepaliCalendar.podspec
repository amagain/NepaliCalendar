#
# Be sure to run `pod lib lint NepaliCalendar.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html

Pod::Spec.new do |s|
  s.name             = "NepaliCalendar"
  s.version          = "0.1.0"
  s.summary          = "NepaliCalendar a converter for AD to BS and BS to AD Date Converter"
  s.description      = <<-DESC
                       * Nepali Date Converter Changes date from AD to BS
                       * Nepali Date Converter Changes date from AD to BS
                       DESC
  s.homepage         = "https://github.com/shrsthakusal/NepaliCalendar"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Bishal Ghimire" => "bishal.ghimire@gmail.com" }
  s.source           = { :git => "https://github.com/shrsthakusal/NepaliCalendar.git"}
  # s.social_media_url = 'https://twitter.com/bishal_ghimire'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'NepaliCalendar' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
