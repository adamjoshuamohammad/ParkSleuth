//
//  AppDelegate.swift
//  ParkSleuth
//
//  Created by Ashley Gong on 4/24/21.
//

import UIKit
import Parse
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let parseConfig = ParseClientConfiguration {
                  $0.applicationId = "rNg4Z9ehAQzkae5FPVrDRv8f0wlri8b179CMcY4S"
                  $0.clientKey = "vzY7bbULE5Mgsv0s5QZc6ReL8l4tUxqKAzfkox9M"
                  $0.server = "https://parseapi.back4app.com/"
        }
        Parse.initialize(with: parseConfig)
        GMSServices.provideAPIKey("AIzaSyDvFkv2h6M4O1GSkR1xz_b2v5UU21Ps8zo")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

