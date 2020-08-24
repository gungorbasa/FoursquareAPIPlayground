//
//  VenueMapContracts.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol VenueMapInteractorProtocol: class {

  var delegate: VenueMapInteractorDelegate? { get set }

  func venues(for latitude: Double, longitude: Double)
  func requestLocationAuthorization()
  func requestLocation()
}

enum VenueMapInteractorOutput {

  case venueList([Venue])
  case error(Error)
  case location(lat: Double, lng: Double)
}

protocol VenueMapInteractorDelegate: class {

  func handleOutput(_ output: VenueMapInteractorOutput)
}

// MARK: - Presenter
protocol VenueMapPresenterProtocol: class {

  func venueRegionDidChange(latitude: Double, longitude: Double)
  func onViewDidLoad()
  func onDidSelect(annotation: AnchorViewModeling?)
}

enum VenueMapPresenterOutput {

  case anchor(AnchorViewModeling)
  case currentLocation(lat: Double, lng: Double)
}

// MARK: - View
protocol VenueMapViewProtocol: class {

  func handleOutput(_ output: VenueMapPresenterOutput)
}

// MARK: - Router
enum VenueMapRoute: Equatable {

  case details(id: String)
}

protocol VenueMapRouterProtocol: class {

  func navigate(to route: VenueMapRoute)
}
