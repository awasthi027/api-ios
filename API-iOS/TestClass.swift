//
//  TestClass.swift
//  API-iOS
//
//  Created by Ashish Awasthi on 07/03/24.
//

import Foundation

public class TestClass {

    public init() { /* No Action */}

    public func completeName(firstName: String, lastName: String) -> String {
        debugPrint("Recevied call from outside module")
        return firstName + lastName
    }
}
