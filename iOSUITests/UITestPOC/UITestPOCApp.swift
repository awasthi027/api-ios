//
//  UITestPOCApp.swift
//  UITestPOC
//
//  Created by Ashish Awasthi on 16/10/23.
//

import SwiftUI

@main
struct UITestPOCApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var rootView: RootScreen = UserDefaults.isUserLogin ? .productList : .homeView

    var body: some Scene {
        WindowGroup {
                if rootView == .homeView {
                    NavHandler {
                        HomeViewScreen()
                            .environment(\.currentRootView, self.$rootView)
                    }
                }else {
                    NavHandler {
                        ProductListView()
                            .environment(\.currentRootView, self.$rootView)
                    }
            }
        }
    }
}



class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        if ProcessInfo.processInfo.arguments.contains("isRunningUITests") {
            // Prepare application for UI tests.
            print("UI Test are running....")
        }
        if let clearLogin = ProcessInfo.processInfo.environment["clearOldData"],
           let clearLoginBool = Bool(clearLogin), clearLoginBool {
           // UserDefaults.isUserLogin = false
        }
        return true
    }

    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier
                     extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        return true
    }
}
