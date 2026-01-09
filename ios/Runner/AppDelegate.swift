import UIKit
import Flutter
import NidThirdPartyLogin

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        // Initialize NaverThirdPartyLoginConnection or other setup if needed
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    //     var applicationResult = false
    //     if (!applicationResult) {
    //         applicationResult = NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
    //     }

    //     // If you use other application URL process, please add code here.

    //     if (!applicationResult) {
    //         applicationResult = super.application(app, open: url, options: options)
    //     }
    //     return applicationResult
    // }

    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (NidOAuth.shared.handleURL(url) == true) { // If the URL was passed from the Naver app
          return true
        }

        debugPrint("url: \(url)")

        if (url.scheme?.hasPrefix("kakao") == true && url.host == "oauth") {
            debugPrint("kakao oauth received")
            return true
        }

        // Handle URLs coming from other apps
        return false
    }
}
