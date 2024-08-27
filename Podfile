use_frameworks!

source 'https://github.com/CocoaPods/Specs'
source 'https://github.com/PopcornTimeTV/Specs'

def pods
    pod 'PopcornTorrent', '~> 1.4.0' # Latest or best-matching version
    pod 'XCDYouTubeKit', '~> 3.0.4' # Updated for tvOS 17
    pod 'Alamofire', '~> 5.7.0' # Updated major version
    pod 'AlamofireImage', '~> 4.1.0' # Updated major version
    pod 'SwiftyTimer', '~> 2.2.0' # Latest or best-matching version
    pod 'FloatRatingView', '~> 4.0.0' # Updated major version
    pod 'Reachability', :git => 'https://github.com/tonymillion/Reachability' # Ensure latest version
    pod 'MarqueeLabel', '~> 4.1.0' # Latest or best-matching version
    pod 'ObjectMapper', '~> 4.2.0' # Updated major version
end

target 'PopcornTimeiOS' do
    platform :ios, '15.0' # Updated to a more recent iOS version
    pods
    pod 'AlamofireNetworkActivityIndicator', '~> 3.5.0' # Latest or best-matching version
    pod 'google-cast-sdk', '~> 4.7.0' # Updated for tvOS 17
    pod 'OBSlider', '~> 2.0.0' # Latest or best-matching version
    pod '1PasswordExtension', '~> 2.1.0' # Updated major version
    pod 'MobileVLCKit', '~> 3.5.0' # Latest or best-matching version
end

target 'PopcornTimetvOS' do
    platform :tvos, '17.0' # Updated to tvOS 17
    pods
    pod 'TvOSMoreButton', '~> 1.3.0' # Latest or best-matching version
    pod 'TVVLCKit', '~> 3.6.0' # Updated for tvOS 17
    pod 'MBCircularProgressBar', '~> 1.0.0' # Latest or best-matching version
end

target 'TopShelf' do
    platform :tvos, '17.0' # Updated to tvOS 17
    pod 'ObjectMapper', '~> 4.2.0' # Updated major version
end

def kitPods
    pod 'Alamofire', '~> 5.7.0' # Updated major version
    pod 'ObjectMapper', '~> 4.2.0' # Updated major version
    pod 'SwiftyJSON', '~> 5.0.0' # Latest or best-matching version
    pod 'Locksmith', '~> 4.0.0' # Latest or best-matching version
end

target 'PopcornKit tvOS' do
    platform :tvos, '17.0' # Updated to tvOS 17
    kitPods
end

target 'PopcornKit iOS' do
    platform :ios, '15.0' # Updated to a more recent iOS version
    kitPods
    pod 'google-cast-sdk', '~> 4.7.0' # Updated for tvOS 17
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