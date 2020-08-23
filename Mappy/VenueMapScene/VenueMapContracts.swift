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
}

enum VenueMapInteractorOutput {

  case venueList([Venue])
  case error(Error)
}

protocol VenueMapInteractorDelegate: class {

  func handleOutput(_ output: VenueMapInteractorOutput)
}

// MARK: - Presenter
protocol VenueMapPresenterProtocol: class {

  func venueRegionDidChange(latitude: Double, longitude: Double)
}

enum VenueMapPresenterOutput: Equatable {

}

// MARK: - View
protocol VenueMapViewProtocol: class {

  func handleOutput(_ output: VenueMapPresenterOutput)
  func addAnnotation(viewModel: AnchorViewModeling)
}

// MARK: - Router
enum VenueMapRoute: Equatable {

}

protocol VenueMapRouterProtocol: class {

  func navigate(to route: VenueMapRoute)
}
