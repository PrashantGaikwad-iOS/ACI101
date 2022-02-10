//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Prashant Gaikwad on 10/02/22.
//  Copyright © 2022 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    
    var entryUnderTest: Entry!
    
    override func setUpWithError() throws {
        entryUnderTest = Entry("Title", "Content")
    }
    
    override func tearDownWithError() throws {
        entryUnderTest = nil
    }
    
    func testSerialization() {
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }
    
}
