//
//  AddressFormatterTest.swift
//  MappyTests
//
//  Created by Gungor Basa on 8/27/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Mappy

final class AddressFormatterTest: XCTestCase {

  private let formatter: AddressFormatting = AddressFormatter()

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testFilledFormattedAddress() throws {
    let location = Location(
      lat: 123,
      lng: 123,
      address: nil,
      formattedAddress: ["1", "2", "3"]
    )
    let formattedAddress = formatter.formattedAddress(from: location)
    XCTAssertTrue("1\n2\n3" == formattedAddress)
  }

  func testNilFormattedAddress() throws {
    let location = Location(
      lat: 123,
      lng: 123,
      address: "Address",
      formattedAddress: nil
    )
    let formattedAddress = formatter.formattedAddress(from: location)
    XCTAssertTrue("Address" == formattedAddress)
  }

  func testNilFormattedAddressAndNilAddress() throws {
    let location = Location(
      lat: 123,
      lng: 123,
      address: nil,
      formattedAddress: nil
    )
    let formattedAddress = formatter.formattedAddress(from: location)
    XCTAssertTrue(formattedAddress == "")
  }
}
