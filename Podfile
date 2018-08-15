# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

target 'VIperTemplate' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for VIperTemplate

  target 'VIperTemplateTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'VIperTemplateUITests' do
    inherit! :search_paths
    # Pods for testing
  end

pod 'GoogleMaps'
pod 'Firebase/Core'
pod 'Firebase/Database'
pod 'Firebase/Auth'
pod 'Firebase/Storage'
pod 'GoogleMaps'
pod 'GooglePlaces'
pod 'GooglePlacePicker'
pod 'Alamofire', '~> 4.4'
pod 'SwiftEventBus', '2.1.2'
pod 'TesseractOCRiOS', '4.0.0'
pod 'GPUImage'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end


end
