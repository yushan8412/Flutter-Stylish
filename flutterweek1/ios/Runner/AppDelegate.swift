import UIKit
import Flutter
import GoogleMaps
//import TPDirect

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
//       TPDSetup.setWithAppId(12348, withAppKey: "app_pa1pQcKoY22IlnSXq5m5WP5jFKzoRG58VEXpT7wU62ud7mMbDOGzCYIlzzLF", with: TPDServerType.sandBox)
//
//         let card = TPDCard.setWithCardNumber("4111111111111111", withDueMonth: "01", withDueYear: "24", withCCV: "123")
//         card.onSuccessCallback { (tpPrime, cardInfo, cardIdentifier, merchantReferenceInfo) in
//             if let tpPrime = tpPrime {
//                 debugPrint("=== Success: \(tpPrime)")
//             }
//         }.onFailureCallback { (status, message) in
//             debugPrint("=== Fail: \(status) \(message)")
//         }.createToken(withGeoLocation: "UNKNOWN")
      
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                                binaryMessenger: controller.binaryMessenger)
      batteryChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        // This method is invoked on the UI thread.
        guard call.method == "getBatteryLevel" else {
          result(FlutterMethodNotImplemented)
          return
        }
        self?.receiveBatteryLevel(result: result)
      })
        GMSServices.provideAPIKey("AIzaSyCCoG7it14FcUr3BghkNv-j0XlVKW0_A7Q")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func receiveBatteryLevel(result: FlutterResult) {

        result("xcoooooooode")
    }
    
}
