//
//  VenueDetailsInteractorTest.swift
//  MappyTests
//
//  Created by Gungor Basa on 8/27/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Mappy

class VenueDetailsInteractorTest: XCTestCase {

  enum DetailsError: Error {
    case testError

    var localizedDescription: String { "test error" }
  }

  private let serviceMock = VenueDetailsServiceMock()
  private let details = VenueDetails(
    location: Location(
      lat: 123,
      lng: 123,
      address: "",
      formattedAddress: []
    ),
    name: "",
    bestPhoto: nil,
    hereNow: nil,
    hours: nil
  )
  private let error = DetailsError.testError
  private var successInteractor: VenueDetailsInteractor?
  private var failInteractor: VenueDetailsInteractor?


  func testSuccess() throws {
    let response = VenuesDetailsResponse(venue: details)
    serviceMock.result = .success(
      response
    )
    successInteractor = VenueDetailsInteractor(serviceMock)
    successInteractor?.delegate = self
    successInteractor?.fetchVenueDetails(id: "id")
  }

  func testFailure() throws {
    serviceMock.result = .failure(DetailsError.testError)
    failInteractor = VenueDetailsInteractor(serviceMock)
    failInteractor?.delegate = self
    failInteractor?.fetchVenueDetails(id: "id")
  }
}

extension VenueDetailsInteractorTest: VenueDetailsInteractorDelegate {

  func handleOutput(_ output: VenueDetailsInteractorOutput) {
    switch output {
    case .details(let details):
      XCTAssertTrue(details == self.details)
    case .error(let error):
      XCTAssertTrue(DetailsError.testError.localizedDescription == error.localizedDescription)
    }
  }
}

extension VenueDetails: Equatable {

  public static func == (lhs: VenueDetails, rhs: VenueDetails) -> Bool {
    return lhs.location == rhs.location &&
      lhs.name == rhs.name &&
      lhs.hours == rhs.hours &&
      lhs.hereNow == rhs.hereNow
  }
}

extension Hours: Equatable {

  public static func == (lhs: Hours, rhs: Hours) -> Bool {
    return lhs.status == rhs.status
  }
}

extension HereNow: Equatable {

  public static func == (lhs: HereNow, rhs: HereNow) -> Bool {
    return lhs.count == rhs.count && lhs.summary == rhs.summary
  }
}

