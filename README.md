# UserAcquisition

## CocoaPods Install
Add ```pod 'UserAcquisition', :git => "https://github.com/inapps-io/UserAcquisition.git"``` to your Podfile. "CRGeneralManager" is the name of the library.

## Usage
In didFinishLaunchingWithOptions method:
```swift
UserAcquisition.shared.configure(withAPIKey: "APIKey")
or
UserAcquisition.shared.configure(withAPIKey: "APIKey", urlRequest: "Here select URL from Enum or enter your")
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

