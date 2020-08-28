//
//  ConfigurationTest.swift
//  MappyTests
//
//  Created by Gungor Basa on 8/28/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Mappy

class ConfigurationTest: XCTestCase {

  private let configuration = Configuration()

  func testFoursquareConfig() throws {
    let foursquareConfig = configuration.foursquareConfig
    XCTAssertTrue(foursquareConfig?.clientId == "abcd")
    XCTAssertTrue(foursquareConfig?.clientSecret == "efgh")
  }
}
