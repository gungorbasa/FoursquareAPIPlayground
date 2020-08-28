//
//  AnchorViewModelFactoryTest.swift
//  MappyTests
//
//  Created by Gungor Basa on 8/28/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Mappy

class AnchorViewModelFactoryTest: XCTestCase {

  private let factory = AnchorViewModelFactory()
  private let venue1 = Venue(
    id: "1",
    name: "One",
    location: Location(
      lat: 123,
      lng: 123,
      address: "address1",
      formattedAddress: ["formatted1"]
    )
  )

  func testExample() throws {
    let viewModel = AnchorViewModel(id: "1", latitude: 123, longitude: 123, title: "One", subtitle: nil)
    let result = factory.anchorViewModel(from: venue1)
    // NOTE: Class already defines an Equatable for the object, so changing Equatable may lead to
    // unwanted results
    XCTAssertTrue(viewModel.coordinate.latitude == result.coordinate.latitude)
    XCTAssertTrue(viewModel.coordinate.longitude == result.coordinate.longitude)
    XCTAssertTrue(viewModel.id == result.id)
    XCTAssertTrue(viewModel.subtitle == result.subtitle)
  }
}
