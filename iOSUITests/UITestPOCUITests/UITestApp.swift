//
//  UITestApp.swift
//  UITestPOCUITests
//
//  Created by Ashish Awasthi on 19/01/24.
//

import Foundation
import XCTest

public class UITestApp: TestApplicationProtocol {

    public var application: XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
       return app
    }
    open lazy var homeScreen: HomeViewScreen = HomeViewScreen(application: self.application)
    open lazy var loginScreen: LoginViewScreen = LoginViewScreen(application: self.application)
    open lazy var productListScreen:ProductListViewScreen = ProductListViewScreen(application: self.application)
    open lazy var productDetailsScreen: ProductDetailsScreen = ProductDetailsScreen(application: self.application)
    open lazy var uiLayoutViewsScreen: UILayoutViewsScreen = UILayoutViewsScreen(application: self.application)
}

extension UITestApp {
    
    func justHangAndWait(timeOut: TimeInterval = 2.0) {
        _ = self.application.alerts["NoAlertJustWait"].waitForExistence(timeout: timeOut)
    }
}
