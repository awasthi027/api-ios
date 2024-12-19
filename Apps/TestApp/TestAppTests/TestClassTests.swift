//
//  TestClassTests.swift
//  API_iOSTests
//
//  Created by Ashish Awasthi on 01/06/24.
//

import XCTest
import api_ios

final class TestClassTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetFullNameSuccess() {
        let obj: TestClass = TestClass()
        let fullName = obj.completeName(firstName: "Ashish", 
                                        lastName: "Awasthi")
        XCTAssertEqual(fullName, "AshishAwasthi")
    }

    func testGetFullNameFail() {
        let obj: TestClass = TestClass()
        let fullName = obj.completeName(firstName: "Ashish", 
                                        lastName: "Awasthi")
        XCTAssertNotEqual(fullName, "Ashish Awasthi")
    }
}
