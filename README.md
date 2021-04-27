# UserAcquisition

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

UserAcquisition is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UserAcquisition', :git => "https://github.com/inapps-io/UserAcquisition.git"
```

## Usage
In didFinishLaunchingWithOptions method:
```swift
UserAcquisition.shared.configure(withAPIKey: "APIKey")
or
UserAcquisition.shared.configure(withAPIKey: "APIKey", urlRequest: "Here select URL from Enum or enter your")

struct Urls: RawRepresentable {
        
    public var rawValue: String
        
    public static let inapps = Urls(rawValue: "https://api.inapps.io/v2")
    public static let subr = Urls(rawValue: "https://api.subr.app/v2")
    public static let chkmob = Urls(rawValue: "https://api.chkmob.com/v2")
    public static let bittiu = Urls(rawValue: "https://api.bittiu.com/v2")
    public static let trklabs = Urls(rawValue: "https://api.trklabs.com/v2")
    public static let devpng = Urls(rawValue: "https://api.devpng.com/v2")
    public static let pingfront = Urls(rawValue: "https://api.pingfront.com/v2")
}
```
After successful purchase:
```swift
UserAcquisition.shared.logPurchase(of: product)
```
After receiving PushDeviceToken:
```swift
UserAcquisition.shared.log(pushDeviceToken: "PushDeviceToken", and originaTransactionID: "OriginalTransactionID")
```
Add AppsFlyer:
```swift
import AppsFlyerLib

extension AppDelegate: AppsFlyerTrackerDelegate {
    func onConversionDataReceived(_ installData: [AnyHashable : Any]!) {
        if let data = installData as? [String: Any] {
            UserAcquisition.shared.conversionInfo.setAppsFlyerData(data)
            UserAcquisition.shared.conversionInfo.appsFlyerId = AppsFlyerTracker.shared().getAppsFlyerUID() ?? ""
        }
    }
}
```
Add Adjust:
```swift
import Adjust

extension AppDelegate: AdjustDelegate {
    func adjustAttributionChanged(_ attribution: ADJAttribution?) {
        if let data = attribution?.dictionary() {
            UserAcquisition.shared.conversionInfo.setAdjustData(data)
        }
    }
}
```
Add YandexMetrica:
```swift
import YandexMobileMetrica

YMMYandexMetrica.requestAppMetricaDeviceID(withCompletionQueue: .main) { [unowned self] id, error in
    UserAcquisition.shared.conversionInfo.appmetricaId = id ?? ""
}
```
Add Amplitude:
```swift
UserAcquisition.shared.conversionInfo.amplitudeId = "Amplitude_KEY"
```

## Author

Mikhail Verenich

Support:
hi@inapps.io

## License

UserAcquisition is available under the MIT license. See the LICENSE file for more info.
