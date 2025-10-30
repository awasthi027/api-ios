//
//  ActionSheetTests.swift
//  UITestPOCUITests
//
//  Created by Ashish Awasthi on 19/01/24.
//

import XCTest

final class ActionSheetTests: BaseUITestcase {

    func testActionSheetActionClick()  {
        describe("Describe: Fresh Application Launch Flow") {
            UITestPOCFlows.launchApplication(application:self.uiTestApp.application)
            uiTestApp.homeScreen.waitForScreen(time: 1)
            uiTestApp.homeScreen.actionONScreen(action: .uiLayoutView)
            self.uiTestApp.uiLayoutViewsScreen.actionONScreen(action: .actionSheetAction)
        }
    }
}
