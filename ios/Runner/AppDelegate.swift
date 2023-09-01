import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      [GMSServices provideAPIKey:@"AIzaSyA9EhGSnmvfY6z1m8bVEtl2PxARwLBgUbc"];
      [GeneratedPluginRegistrant registerWithRegistry:self];
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
