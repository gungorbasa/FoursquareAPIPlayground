//
//  VenueDetailsContracts.swift
//  Mappy
//
//  Created Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol VenueDetailsInteractorProtocol: class {
  
  var delegate: VenueDetailsInteractorDelegate? { get set }

  func fetchVenueDetails(id: String)
}

enum VenueDetailsInteractorOutput {
  
  case details(VenueDetails)
  case error(Error)
}

protocol VenueDetailsInteractorDelegate: class {
  
  func handleOutput(_ output: VenueDetailsInteractorOutput)
}

// MARK: - Presenter
protocol VenueDetailsPresenterProtocol: class {

  func onViewDidLoad()
}

enum VenueDetailsPresenterOutput {
  
  case image(URL)
  case name(String)
  case address(String)
  case hours(String)
  case alert(String)
}

// MARK: - View
protocol VenueDetailsViewProtocol: class {
  
  func handleOutput(_ output: VenueDetailsPresenterOutput)
}

// MARK: - Router
enum VenueDetailsRoute: Equatable {
  
}

protocol VenueDetailsRouterProtocol: class {
  
  func navigate(to route: VenueDetailsRoute)
}
