import UIKit
import Flutter
import TPDirect

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      TPDSetup.setWithAppId(12348, withAppKey: "app_pa1pQcKoY22IlnSXq5m5WP5jFKzoRG58VEXpT7wU62ud7mMbDOGzCYIlzzLF", with: TPDServerType.sandBox)
      
//      let card = TPDCard.setWithCardNumber("4111111111111111", withDueMonth: "01", withDueYear: "24", withCCV: "123")
//      card.onSuccessCallback { (tpPrime, cardInfo, cardIdentifier, merchantReferenceInfo) in
//          if let tpPrime = tpPrime {
//              debugPrint("=== Success: \(tpPrime)")
//          }
//      }.onFailureCallback { (status, message) in
//          debugPrint("=== Fail: \(status) \(message)")
//      }.createToken(withGeoLocation: "UNKNOWN")
      
      
      let card = TPDCard.setWithCardNumber("4111111111111111", withDueMonth: "01", withDueYear: "24", withCCV: "123")

      card.onSuccessCallback { (prime, cardInfo, cardIdentifier) in
          
          print("Prime : \(prime!), cardInfo : \(cardInfo), cardIdentifier : \(cardIdentifier)")

      }.onFailureCallback { (status, message) in

          print("status : \(status) , Message : \(message)")

      }.getPrime()
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
