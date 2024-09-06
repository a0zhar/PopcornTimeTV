use_frameworks!

source 'https://github.com/CocoaPods/Specs'
source 'https://github.com/PopcornTimeTV/Specs'

def pods
    pod 'PopcornTorrent', '~> 1.3.0'
    pod 'XCDYouTubeKit', '~> 2.8.0'
    pod 'Alamofire', '~> 4.9.0'
    pod 'AlamofireImage', '~> 3.5.0'
    pod 'SwiftyTimer', '~> 2.1.0'
    pod 'FloatRatingView', '~> 3.0.1'
    pod 'ReachabilitySwift'
    pod 'MarqueeLabel', '~> 4.0.0'
    pod 'ObjectMapper', '~> 3.5.0'
end


target 'PopcornTimetvOS' do
    platform :tvos, '10.2'
    pods
    pod 'TvOSMoreButton', '~> 1.2.0'
    pod 'TVVLCKit', '~> 3.3.0'
    pod 'MBCircularProgressBar', '~> 0.3.5-1'
end

target 'TopShelf' do
    platform :tvos, '10.2'
    pod 'ObjectMapper', '~> 3.5.0'
end

def kitPods
    pod 'Alamofire', '~> 4.9.0'
    pod 'ObjectMapper', '~> 3.5.0'
    pod 'SwiftyJSON', '~> 5.0.0'
    pod 'Locksmith', '~> 4.0.0'
end

target 'PopcornKit tvOS' do
    platform :tvos, '10.2'
    kitPods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
        end
        if ['FloatRatingView-iOS', 'FloatRatingView-tvOS'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
