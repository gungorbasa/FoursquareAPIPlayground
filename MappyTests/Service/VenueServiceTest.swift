//
//  VenueServiceTest.swift
//  MappyTests
//
//  Created by Gungor Basa on 8/28/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Mappy

class VenueServiceTest: XCTestCase {

  enum VenueServiceError: Error {
    case testError
  }

  private let networking = NetworkingMock()
  private let location = Location(lat: 123, lng: 123, address: nil, formattedAddress: nil)

  private lazy var venue1 = Venue(id: "1", name: "One", location: location)
  private lazy var venue2 = Venue(id: "2", name: "Two", location: location)

  func testSuccess() throws {
    let response = VenuesResponse(venues: [venue1, venue2])
    networking.result = Result<VenuesResponse, Error>.success(response)
    let service = VenueService(networking: networking)
    let expectation = self.expectation(description: "Success")
    service.fetch(123, longitude: 123) { result in
      switch result {
      case .success(let details):
        XCTAssertTrue(details.venues.count == 2)
      case .failure:
        XCTFail("Should not fail")
      }
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 2.0)
  }

  func testFailure() throws {
    networking.result = Result<VenuesResponse, Error>.failure(VenueServiceError.testError)
    let service = VenueService(networking: networking)
    let expectation = self.expectation(description: "Success")
    service.fetch(123, longitude: 123) { result in
      switch result {
      case .success:
        XCTFail("Should not be successful")
      case .failure:
        break
      }
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 2.0)
  }
}
